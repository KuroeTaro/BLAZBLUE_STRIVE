function get_current_resolution()
    local width, height, flags = love.window.getMode()
    if width < 1600 then RES_PARTTEN = 0 
    elseif width < 1920 then RES_PARTTEN = 1
    elseif width < 2560 then RES_PARTTEN = 2
    elseif width < 3840 then RES_PARTTEN = 3
    else RES_PARTTEN = 4 end
end
function set_current_resolution()
    if RES_PARTTEN == 0 then 
        love.window.setMode(1280,720,{})
        love.filesystem.write('resolution_config.lua','12800720')
    elseif RES_PARTTEN == 1 then 
        love.window.setMode(1600,900,{})
        love.filesystem.write('resolution_config.lua','16000900')
    elseif RES_PARTTEN == 2 then 
        love.window.setMode(1920,1080,{})
        love.filesystem.write('resolution_config.lua','19201080')
    elseif RES_PARTTEN == 3 then 
        love.window.setMode(2560,1440,{})
        love.filesystem.write('resolution_config.lua','25601440')
    elseif RES_PARTTEN == 4 then 
        love.window.setMode(3840,2160,{})
        love.filesystem.write('resolution_config.lua','38402160')
    end
end