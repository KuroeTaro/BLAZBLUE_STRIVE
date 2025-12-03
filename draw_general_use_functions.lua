function draw_resolution_correction(length)
    local ratio = love.graphics.getWidth()/1600
    local result = length * ratio
    return result
end

function draw_2d_image(obj,image)
    local x = draw_resolution_correction(obj[1])
    local y = draw_resolution_correction(obj[2])
    local sx = draw_resolution_correction(obj[5])
    local sy = draw_resolution_correction(obj[6])
    local r = obj[7]
    local opacity = obj[4]

    if opacity == 0 then
        return
    end

    love.graphics.setColor(1, 1, 1, obj[4])
    love.graphics.draw(image,x,y,r,sx,sy)
    love.graphics.setColor(1, 1, 1, 1)
end 
function draw_2d_image_table(obj,image_table)
    local x = draw_resolution_correction(obj[1])
    local y = draw_resolution_correction(obj[2])
    local sx = draw_resolution_correction(obj[5])
    local sy = draw_resolution_correction(obj[6])
    local r = obj[7]
    local f = obj[8]
    local opacity = obj[4]

    if opacity == 0 then
        return
    end

    love.graphics.setColor(1, 1, 1, obj[4])
    love.graphics.draw(image_table[f],x,y,r,sx,sy)
    love.graphics.setColor(1, 1, 1, 1)
end

function draw_solid(obj)
    local w = love.graphics.getWidth()
    local h = love.graphics.getHeight()
    local opacity = obj[4]

    if opacity == 0 then
        return
    end

    love.graphics.setColor(obj["rgb"][1],obj["rgb"][2],obj["rgb"][3], obj[4])
    love.graphics.rectangle("fill", 0,0, w,h)
    love.graphics.setColor(1, 1, 1, 1)
end

function draw_3d_image(camera,obj,image)
    local z = obj[3]
    local sx = obj[5]
    local sy = obj[6]
    local r = obj[7]
    local f = obj[8]
    local opacity = obj[4]
    local camera_z = camera[3]
    local scale = draw_resolution_correction(800)/(z-camera_z)
    local cood_res = draw_3d_point_to_2D(camera,obj)

    if opacity == 0 then
        return
    end

    love.graphics.setColor(1, 1, 1, opacity)
    love.graphics.draw(image,cood_res[1],cood_res[2],r,sx*scale,sy*scale)
    love.graphics.setColor(1, 1, 1, 1)
end
function draw_3d_image_table(camera,obj,image_table)
    local z = obj[3]
    local sx = obj[5]
    local sy = obj[6]
    local r = obj[7]
    local f = obj[8]
    local opacity = obj[4]
    local camera_z = camera[3]
    local scale = draw_resolution_correction(800)/(z-camera_z)
    local cood_res = draw_3d_point_to_2D(camera,obj)

    if opacity == 0 then
        return
    end

    love.graphics.setColor(1, 1, 1, opacity)
    love.graphics.draw(image_table[f],cood_res[1],cood_res[2],r,sx*scale,sy*scale)
    love.graphics.setColor(1, 1, 1, 1)
end
function draw_3d_point_to_2D(camera,obj)
    -- x y z opacity sx sy r f
    local x = obj[1]
    local y = obj[2]
    local z = obj[3]
    
    local camera_x = camera[1]
    local camera_y = camera[2]
    local camera_z = camera[3]

    local scale = draw_resolution_correction(800)/(z-camera_z)

    local cood_res = {
        scale * (x - camera_x) + draw_resolution_correction(800), 
        scale * (y - camera_y) + draw_resolution_correction(450)
    }
    
    return cood_res
end

function draw_sector(x, y, radius, startAngle, endAngle, segments)
    -- 计算每个三角形的角度增量
    local angleIncrement = (endAngle - startAngle) / segments

    -- 画扇形
    for i = 0, segments do
        local angle1 = startAngle + i * angleIncrement
        local angle2 = startAngle + (i + 1) * angleIncrement

        -- 计算每个三角形的三个顶点
        local x1 = x + radius * math.cos(angle1)
        local y1 = y + radius * math.sin(angle1)
        local x2 = x + radius * math.cos(angle2)
        local y2 = y + radius * math.sin(angle2)

        -- 绘制三角形
        love.graphics.polygon("fill", x, y, x1, y1, x2, y2)
    end
end

function draw_2d_image_sprite_batch(obj,image_sprite_sheet,quad_name)
    local x = draw_resolution_correction(obj[1])
    local y = draw_resolution_correction(obj[2])
    local sx = draw_resolution_correction(obj[5])
    local sy = draw_resolution_correction(obj[6])
    local r = obj[7]
    local opacity = obj[4]

    if opacity == 0 then
        return
    end

    local frame = image_sprite_sheet["frames"][quad_name]

    local quad = love.graphics.newQuad(
        frame[1],
        frame[2],
        frame[3],
        frame[4],
        frame[5],
        frame[6]
    )

    image_sprite_sheet["sprite_batch"]:setColor(1, 1, 1, opacity)
    image_sprite_sheet["sprite_batch"]:add(quad, x, y, r, sx, sy)
    image_sprite_sheet["sprite_batch"]:setColor(1, 1, 1, 1)
end
function draw_3d_image_sprite_batch(camera,obj,image_sprite_sheet,quad_name)
    local z = obj[3]
    local sx = obj[5]
    local sy = obj[6]
    local r = obj[7]
    local f = obj[8]
    local opacity = obj[4]
    local camera_z = camera[3]
    local scale = draw_resolution_correction(800)/(z-camera_z)
    local cood_res = draw_3d_point_to_2D(camera,obj)

    if opacity == 0 then
        return
    end

    local frame = image_sprite_sheet["frames"][quad_name]

    local quad = love.graphics.newQuad(
        frame[1],
        frame[2],
        frame[3],
        frame[4],
        frame[5],
        frame[6]
    )

    image_sprite_sheet["sprite_batch"]:setColor(1, 1, 1, opacity)
    image_sprite_sheet["sprite_batch"]:add(quad, cood_res[1], cood_res[2], r, sx*scale, sy*scale)
    image_sprite_sheet["sprite_batch"]:setColor(1, 1, 1, 1)
end
function draw_3d_color_box(camera,obj_box,color)
    local cood_res = draw_3d_point_to_2D(camera,obj_box)
    local x = draw_resolution_correction(cood_res[1])
    local y = draw_resolution_correction(cood_res[2])
    local sx = obj_box[4]
    local sy = obj_box[5]
    local z = obj_box[3]
    local camera_z = camera[3]

    local scale = draw_resolution_correction(800)/(z-camera_z)

    love.graphics.setColor(color[1], color[2], color[3], color[4])
    love.graphics.rectangle("fill", cood_res[1], cood_res[2], obj_box["w"]*scale*sx, obj_box["h"]*scale*sy)
    love.graphics.rectangle("line", cood_res[1], cood_res[2], obj_box["w"]*scale*sx, obj_box["h"]*scale*sy)
    love.graphics.setColor(1,1,1,1)
end