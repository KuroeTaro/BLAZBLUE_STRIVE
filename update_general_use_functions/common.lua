function sprite_sheet_load(json_file, image)
    -- 读取 JSON 文件
    local file = love.filesystem.read(json_file)
    local data = JSON.decode(file)
    -- 加载纹理
    local sprite_batch = love.graphics.newSpriteBatch(image, 100, "dynamic", { "position", "color" })
    local frames = {}
    -- 遍历 JSON 数据，生成 Love2D 兼容的表
    for name, frame in pairs(data.frames) do
        frames[name] = {
            frame.frame.x, frame.frame.y, frame.frame.w, frame.frame.h,
            image:getDimensions()
        }
    end
    return {
        sprite_batch = sprite_batch,
        frames = frames
    }
end