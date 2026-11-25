require "love.filesystem"
local base = "asset/game_scene/stage/alpha/audio/"
local thread_data = {}
local file_name_table = {
    "air_backdash","air_dash","air_jump","air_SP_jump",
    "ground_dash_cancel","ground_dash_loop","ground_dash_skid","ground_dash_start_up",
    "ground_hard_knockdown","ground_land","ground_soft_knockdown",
    "ground_step_0","ground_step_1","wall_wallbreak","wall_wallstick"
}
local thread_common = require "threads.thread_common"
local sound_module = thread_common.new_sound_data
thread_data["character_interactive_SFX"] = {}
for i = 1,#file_name_table do
    local name = file_name_table[i]
    thread_data["character_interactive_SFX"][name] =
    sound_module(base .. "character_interactive_SFX/" .. name .. ".ogg")
end
-- environment_SFX
thread_data["environment_SFX"] = {}
thread_data["environment_SFX"]["wallbreak_knockdown"] = sound_module(base .. "environment_SFX/wallbreak_knockdown.ogg")
thread_data["environment_SFX"]["wind"] = sound_module(base .. "environment_SFX/wind.ogg")
love.thread.getChannel('thread_data_18'):push(thread_data)