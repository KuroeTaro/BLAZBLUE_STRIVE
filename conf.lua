function love.conf(t)
    local res = love.filesystem.read( 'resolution_config.lua',8 )
    if res then 
        local width = tonumber(string.sub(res,1,4))
        local height = tonumber(string.sub(res,5,8))
        t.window.width = width
        t.window.height = height
    else
        t.window.width = 1600
        t.window.height = 900
        love.filesystem.write('resolution_config.lua','16000900')
    end

    t.console = true
    t.window.title = "BLAZBLUE_STRIVE.ver.1/4.005"
    t.window.vsync = 0
    t.modules.physics = false 
    t.modules.touch = false 
    t.modules.video = false
    t.modules.math = false
    t.modules.mouse = false
    if t.version == "12.0" then
        t.graphics.renderers = {"vulkan"} 
    end
end 