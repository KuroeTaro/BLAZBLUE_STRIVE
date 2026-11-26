-- start_scene 的 static SFX(load_start_scene_audio 见 scenes/start_scene/init.lua)
-- 解码 ogg 很慢,放在线程里做,主线程只用 SoundData / Decoder 建 Source
require "love.filesystem"
local base = "asset/start_scene/audio/"
local thread_data = {}
local file_name_table = {
    "SFX_confirm_0","SFX_confirm_1","SFX_confirm_2","SFX_confirm_3","SFX_exit_0","SFX_exit_1",
    "SFX_up_0","SFX_up_1","SFX_down_0","SFX_down_1","SFX_left_0","SFX_left_1","SFX_right_0",
    "SFX_right_1","SFX_blazblue_confirm_echo","SFX_scene_out"
}
local thread_common = require "threads/thread_common"
local sound_module = thread_common.new_sound_data
for i = 1,#file_name_table do
    local name = file_name_table[i]
    thread_data[name] = sound_module(base .. name .. ".ogg")
end
-- BGM 是 stream:线程里只建 Decoder(打开 ogg 要读文件头、找结尾),主线程用它建 Source
thread_data["BGM_NOC_high"] = thread_common.new_decoder(base .. "BGM_NOC_high.ogg")
thread_data["BGM_NOC_low"] = thread_common.new_decoder(base .. "BGM_NOC_low.ogg")
love.thread.getChannel('thread_data_4'):push(thread_data)
