-- 线程里共用的小工具(在线程文件里先 require "love.filesystem",再 require "threads.thread_common")
-- 资源从每个目录的 _pack.bin 里读(由 tools/asset_pack.py 生成,改了素材要重新跑一次那个脚本):
--   这台机器上每打开一个文件固定要 20ms 以上,散文件一张张开太慢;一个目录只开一次包,
--   之后按索引 seek + read。.dds 在包里是 zlib 压缩的,在这里解压,主线程拿到的还是 CompressedData
--   中间的 Data 用完立刻 release:线程里 GC 不一定及时,几十 MB 的缓冲留着会把内存顶上去
require "love.filesystem"
require "love.data"
require "love.image"
require "love.sound"
local thread_common = {}
local PACK_NAME = "_pack.bin"
local PACK_MAGIC = "BBSPACK1"
-- [目录] = {file = File,index = {[文件名] = {压缩,偏移,大小}}};目录里没有包 = false
-- 每个线程各自一份(线程结束时 Lua state 关闭,File 跟着关掉)
local pack_table = {}
local function get_pack(dir)
    local pack = pack_table[dir]
    if pack == nil then
        local pack_path = dir .. "/" .. PACK_NAME
        if love.filesystem.getInfo(pack_path,"file") then
            local file = love.filesystem.newFile(pack_path,"r")
            local header = file:read(12)
            if string.sub(header,1,8) ~= PACK_MAGIC then
                error(pack_path .. " 不是资源包,重新跑 tools/asset_pack.py")
            end
            local index_length = love.data.unpack("<I4",header,9)
            local index = {}
            for name,flag,offset,size in string.gmatch(file:read(index_length),"([^\t\n]+)\t(%d)\t(%d+)\t(%d+)\n") do
                index[name] = {tonumber(flag),tonumber(offset),tonumber(size)}
            end
            pack = {file = file,index = index}
        else
            pack = false
        end
        pack_table[dir] = pack
    end
    return pack
end
-- 找 path 在包里的条目,没有返回 nil
local function find_entry(path)
    local dir,name = string.match(path,"^(.*)/([^/]+)$")
    local pack = get_pack(dir)
    if pack == false then
        return nil
    end
    local entry = pack.index[name]
    if entry == nil then
        return nil
    end
    return entry,pack.file
end
-- 读出条目的原始内容(压缩过的先解压),返回带文件名的 FileData(解码器按扩展名认格式)
local function read_file_data(path)
    local entry,file = find_entry(path)
    if entry == nil then
        error(path .. " 不在资源包里(改了素材要重新跑 tools/asset_pack.py)")
    end
    file:seek(entry[2])
    local data = file:read("data",entry[3])
    if entry[1] == 1 then
        local raw = love.data.decompress("data","zlib",data)
        data:release()
        data = raw
    end
    local file_data = love.filesystem.newFileData(data,path)
    data:release()
    return file_data
end
-- 贴图(.dds)
function thread_common.new_compressed_data(path)
    local file_data = read_file_data(path)
    local compressed_data = love.image.newCompressedData(file_data)
    file_data:release()
    return compressed_data
end
-- static 音效:整段解码成 SoundData
function thread_common.new_sound_data(path)
    local file_data = read_file_data(path)
    local sound_data = love.sound.newSoundData(file_data)
    file_data:release()
    return sound_data
end
-- stream 音频(BGM):主线程用 love.audio.newSource(decoder,"stream") 建 Source
-- 打开 ogg 要读文件头、找结尾,放在线程里做;FileData 由 Decoder 引用着,这里不 release
function thread_common.new_decoder(path)
    return love.sound.newDecoder(read_file_data(path))
end
-- 包里的文本(json),没有返回 nil
function thread_common.read_text(path)
    local entry,file = find_entry(path)
    if entry == nil then
        return nil
    end
    file:seek(entry[2])
    return (file:read(entry[3]))
end
-- 包一层贴图读取函数:读完贴图顺手把同目录、同名的 .json(序列帧数据)也读成字符串,存进 text_table
--   key = 把传进来的路径的扩展名换成 .json,和主线程 common_sprite_sheet_load 里写的路径一致
--   json 在包里紧挨着同名贴图;主线程拿到 ASSET_DATA 时一并收进 FILE_TEXT_CACHE,
--   之后 common_read_text 直接取,主线程加载时就不用自己读盘
function thread_common.with_sibling_json(load_function,text_table)
    return function(path)
        local data = load_function(path)
        local json_path = string.gsub(path,"%.[^%./]+$",".json")
        local text = thread_common.read_text(json_path)
        if text ~= nil then
            text_table[json_path] = text
        end
        return data
    end
end
-- 读一组不在 asset/ 里的文本文件(shader 源码等)进 text_table,主线程用 common_read_text 取
function thread_common.read_text_list(path_table,text_table)
    for i = 1,#path_table do
        local path = path_table[i]
        text_table[path] = love.filesystem.read(path)
    end
end
return thread_common
