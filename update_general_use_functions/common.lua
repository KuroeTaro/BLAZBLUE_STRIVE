function common_sprite_sheet_load(json_file,image)
    -- 读取 JSON 文件
    local file = love.filesystem.read(json_file)
    local data = JSON.decode(file)
    -- 加载纹理
    local sprite_batch = love.graphics.newSpriteBatch(image,100,"dynamic",{ "position","color" })
    local frames = {}
    -- 遍历 JSON 数据，生成 Love2D 兼容的表
    -- 序号帧的 key 在 json 里已经是裸数字(tools/json_frame_key_to_number.py),
    -- 这里再兜底一次:TexturePacker 重新导出把 key 变回 "0" / "0.png" 时也不会查不到。
    for name,frame in pairs(data.frames) do
        local frame_key = tonumber(name)
        if not frame_key then
            -- "0.png" 这种「序号 + 扩展名」的帧名归一到数字
            frame_key = tonumber(tostring(name):match("^(%d+)%.[%a]+$"))
        end
        frames[frame_key or name] = {
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
function common_particle_mesh_new(particle_count,mesh_usage)
    -- 通用「按粒子编号生成 quad mesh」工厂:任意数量的粒子共用一次 draw call。
    -- 顶点数据沿用 LOVE 默认顶点格式(不自定义 attribute,11.x / 12.0 行为一致):
    --     VertexPosition.xy = quad 角点(0/1)
    --     VertexTexCoord.x  = 粒子编号(0..particle_count-1)
    --     VertexTexCoord.y  = 0,颜色固定白
    -- 位置 / 尺寸 / 旋转 / 拖尾都交给顶点着色器按「粒子编号 + 当前帧」算,
    -- 所以 CPU 侧没有逐粒子开销;同一批粒子只换 uniform,不必重建 mesh。
    -- particle_count:粒子数量,小于 1 时按 1 处理
    -- mesh_usage:"static"(默认,建一次反复画)/ "dynamic" / "stream"(CPU 侧改顶点)
    -- 返回:love.graphics.newMesh 生成的 mesh
    assert(type(particle_count) == "number","common_particle_mesh_new: particle_count 必须是数字")
    particle_count = math.floor(particle_count)
    if particle_count < 1 then
        particle_count = 1
    end
    local usage = mesh_usage or "static"
    -- 每颗粒子两个三角形,角点顺序(屏幕坐标 y 向下):(0,0)(1,0)(1,1) / (0,0)(1,1)(0,1)
    local corner_x = {0,1,1,0,1,0}
    local corner_y = {0,0,1,0,1,1}
    local vertices = {}
    local write = 0
    for i = 0,particle_count - 1,1 do
        for c = 1,6,1 do
            write = write + 1
            -- x,y = 角点(0/1),u = 粒子编号,v = 0
            vertices[write] = {corner_x[c],corner_y[c],i,0,1,1,1,1}
        end
    end
    return love.graphics.newMesh(vertices,"triangles",usage)
end
function common_queue_new(length)
    local res = {}
    res["length"] = length
    res["content"] = {}
    return res
end
function common_queue_push(queue,v)
    local current_length = #queue["content"] + 1
    local static_length = queue["length"]
    queue["content"][current_length] = v
    if static_length == -1 then
        return
    elseif current_length > static_length then
        table.remove(queue["content"],1)
    end
end
function common_queue_pop(queue)
    local res = queue["content"][1]
    table.remove(queue["content"],1)
    return res
end
function common_ringbuffer_new(length)
    local res = {}
    res["length"] = length
    res["content"] = {}
    res["head"] = 1
    res["count"] = 0
    return res
end
function common_ringbuffer_push(rb,v)
    rb["content"][rb["head"]] = v
    rb["head"] = (rb["head"] % rb["length"]) + 1
    if rb["count"] < rb["length"] then
        rb["count"] = rb["count"] + 1
    end
end
function common_ringbuffer_get(rb,index)
    if index < 1 or index > rb["count"] then
        return nil
    end
    local latest = ((rb["head"] - 2) % rb["length"]) + 1
    local pos = ((latest - index) % rb["length"]) + 1
    return rb["content"][pos]
end