function common_sprite_sheet_load(json_file,image)
    -- 读取 JSON 文件
    local file = love.filesystem.read(json_file)
    local data = JSON.decode(file)
    -- 加载纹理
    local sprite_batch = love.graphics.newSpriteBatch(image,100,"dynamic",{ "position","color" })
    local frames = {}
    -- 遍历 JSON 数据，生成 Love2D 兼容的表
    for name,frame in pairs(data.frames) do
        frames[name] = {
            frame.frame.x,frame.frame.y,frame.frame.w,frame.frame.h,
            image:getDimensions()
        }
    end
    sprite_batch:add(0,0)
    love.graphics.draw(sprite_batch)
    return {
        sprite_batch = sprite_batch,
        frames = frames
    }
end

function common_queue_new(length)
    local res = {}
    res["length"] = length
    res["content"] = {}
    return res
end
function common_queue_push(queue,v)
    local current_length = #queue["content"]+1
    local static_length = queue["length"]

    queue["content"][current_length] = v
    if static_length == -1 then
        return
    elseif current_length > static_length then
        table.remove(queue["content"], 1)
    end
end
function common_queue_pop(queue)
    local res = queue["content"][1]
    table.remove(queue["content"], 1)
    return res
end
