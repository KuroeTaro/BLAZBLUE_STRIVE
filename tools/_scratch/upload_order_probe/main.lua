-- 同一帧里多次 replacePixels 同一张贴图,每次之后各画一次:GPU 是否按调用顺序看到各自的数据
--   H:/_love/_12.0/lovec.exe H:/_love/BLAZBLUE_STRIVE/tools/_scratch/upload_order_probe
--   换 OpenGL:先 set ARUA_RENDERER=opengl 再运行
-- 6SP_P 的粒子数据贴图是同一侧共用的:同时有两个光环(旧的在 end 阶段 + 新的)时,
-- 一帧里会 写 A -> 画 A -> 写 B -> 画 B。如果上传被挪到这一帧所有绘制之前,A 会用 B 的粒子 + A 的包围盒去画。
local DIR = "H:/_love/BLAZBLUE_STRIVE/tools/_scratch/upload_order_probe"
local lines = {}
local function log(s) lines[#lines + 1] = tostring(s) end
local function flush()
    local f = io.open(DIR .. "/result.txt","w")
    if f then f:write(table.concat(lines,"\n")); f:close() end
end
function love.errorhandler(msg)
    local f = io.open(DIR .. "/result.txt","w")
    if f then
        f:write(table.concat(lines,"\n"))
        f:write("\nERROR: " .. tostring(msg) .. "\n")
        f:write(debug.traceback("",2))
        f:close()
    end
    os.exit(1)
end

local SRC = [[
extern Image data;
vec4 effect(vec4 color, Image tex, vec2 tc, vec2 sc) {
    return vec4(Texel(data, vec2(0.5, 0.5)).r, 0.0, 0.0, 1.0);
}
]]
local N = 6
local shader,data_image_data,data_image,quad,canvas
local values = {}

-- 和 6SP_P 一样的调用顺序:每次 setPixel + replacePixels + send + setShader + draw + setShader(上一个)
local function draw_sequence()
    for i = 1,N do
        data_image_data:setPixel(0,0,values[i],0,0,0)
        data_image:replacePixels(data_image_data)
        shader:send("data",data_image)
        local previous = love.graphics.getShader()
        love.graphics.setShader(shader)
        love.graphics.setColor(1,1,1,1)
        love.graphics.setBlendMode("alpha")
        love.graphics.draw(quad,(i - 1)*40,0,0,40,40)
        love.graphics.setShader(previous)
    end
end

local function read_row(image_data,tag)
    local got = {}
    local ok = true
    for i = 1,N do
        local r = image_data:getPixel((i - 1)*40 + 20,20)
        got[i] = string.format("%.2f",r)
        if math.abs(r - values[i]) > 0.02 then ok = false end
    end
    local want = {}
    for i = 1,N do want[i] = string.format("%.2f",values[i]) end
    log(string.format("%-28s want %s",tag,table.concat(want," ")))
    log(string.format("%-28s got  %s   -> %s",tag,table.concat(got," "),
        ok and "IN ORDER" or "NOT IN ORDER (每次绘制没有看到自己那次上传的数据)"))
    return ok
end

local frame = 0
local results = {}
function love.load()
    log("love version: " .. table.concat({love.getVersion()},"."))
    log("renderer: " .. table.concat({love.graphics.getRendererInfo()}," | "))
    shader = love.graphics.newShader(SRC)
    data_image_data = love.image.newImageData(4,1,"rgba32f")
    data_image = love.graphics.newImage(data_image_data)
    data_image:setFilter("nearest","nearest")
    local q = love.image.newImageData(1,1)
    q:setPixel(0,0,1,1,1,1)
    quad = love.graphics.newImage(q)
    canvas = love.graphics.newCanvas(N*40,40)
    for i = 1,N do values[i] = i/(N + 1) end
end

function love.draw()
    frame = frame + 1
    love.graphics.clear(0,0,0,1)
    if frame == 2 then
        -- 1) 画到 canvas
        love.graphics.push("all")
        love.graphics.setCanvas(canvas)
        love.graphics.clear(0,0,0,1)
        draw_sequence()
        love.graphics.pop()
        local d = love.graphics.readbackTexture and love.graphics.readbackTexture(canvas) or canvas:newImageData()
        results[1] = read_row(d,"canvas")
        -- 2) 和游戏里一样直接画到屏幕(之前先画点别的,确保在 render pass 中间)
        love.graphics.setColor(0.2,0.2,0.2,1)
        love.graphics.rectangle("fill",0,100,400,40)
        love.graphics.setColor(1,1,1,1)
        love.graphics.push()
        love.graphics.translate(0,0)
        draw_sequence()
        love.graphics.pop()
        love.graphics.captureScreenshot(function(image_data)
            results[2] = read_row(image_data,"screen (like in game)")
            log("")
            log((results[1] and results[2]) and "RESULT: uploads IN ORDER" or "RESULT: uploads NOT IN ORDER")
            flush()
            love.event.quit()
        end)
    end
end
