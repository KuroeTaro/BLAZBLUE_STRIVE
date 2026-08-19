local filesys_module = require "love.filesystem"
local auido_module = require "love.sound"
local sound_module = auido_module.newSoundData
local thread_data = {}
local base = "asset/game_scene/stage/alpha/audio/"
-- character_interactive_SFX (L/R 共用同一批 SoundData)
thread_data["character_interactive_SFX"] = {}
local file_name_table = {
    "air_backdash","air_dash","air_jump","air_SP_jump",
    "ground_dash_cancel","ground_dash_loop","ground_dash_skid","ground_dash_start_up",
    "ground_hard_knockdown","ground_land","ground_soft_knockdown",
    "ground_step_0","ground_step_1","wall_wallbreak","wall_wallstick"
}
for i = 1,#file_name_table do
    local name = file_name_table[i]
    thread_data["character_interactive_SFX"][name] = sound_module(base .. "character_interactive_SFX/" .. name .. ".wav")
end
-- environment_SFX
thread_data["environment_SFX"] = {}
thread_data["environment_SFX"]["wallbreak_knockdown"] = sound_module(base .. "environment_SFX/wallbreak_knockdown.wav")
thread_data["environment_SFX"]["wind"] = sound_module(base .. "environment_SFX/wind.wav")
love.thread.getChannel( 'thread_data_10' ):push( thread_data )
