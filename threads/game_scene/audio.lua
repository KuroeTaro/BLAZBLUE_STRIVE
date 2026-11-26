-- game_scene 公共 SFX(load_game_scene_common_audio 见 scenes/game_scene/_common/init.lua)
require "love.filesystem"
local base = "asset/game_scene/common/audio/"
local thread_data = {}
local thread_common = require "threads/thread_common"
-- 从 _pack.bin 里读 ogg 再解码(见 threads/thread_common.lua)
local sound_module = thread_common.new_sound_data
local file_name_table = {"annoucer_ease_in","common_risk_force_counter","common_throw_tech"}
for i = 1,#file_name_table do
    local name = file_name_table[i]
    thread_data[name] = sound_module(base .. name .. ".ogg")
end
love.thread.getChannel('thread_data_10'):push(thread_data)
