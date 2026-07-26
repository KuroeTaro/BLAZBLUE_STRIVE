function read_volume_config()
    BGM_VOLUME = nil
    SFX_VOLUME = nil
    local chunk = love.filesystem.load( 'audio_config.lua' ) 
    if chunk then 
        chunk()
        if BGM_VOLUME == nil then 
            BGM_VOLUME = 5
            SFX_VOLUME = 5
        end
    else 
        BGM_VOLUME = 5
        SFX_VOLUME = 5
        write_volume_config()
    end
end
function write_volume_config()
    local chunk = 
    [[ BGM_VOLUME = ]]..BGM_VOLUME.."\n"..
    [[ SFX_VOLUME = ]]..SFX_VOLUME..[[ ]]
    love.filesystem.write('audio_config.lua',chunk)
end
-- function update_BGM_VOLUME(src)
--     src:setVolume(BGM_VOLUME/10)
-- end
-- function update_SFX_VOLUME(src)
--     src:setVolume(SFX_VOLUME/10)
-- end
function update_BGM_VOLUME(obj)
    obj["audio"]:setVolume(obj[1]*BGM_VOLUME/10)
end
function update_SFX_VOLUME(obj)
    obj["audio"]:setVolume(obj[1]*SFX_VOLUME/10)
end
function play_obj_audio(obj)
    love.audio.stop(obj["audio"])
    love.audio.play(obj["audio"])
end
function stop_obj_audio(obj)
    love.audio.stop(obj["audio"])
end
