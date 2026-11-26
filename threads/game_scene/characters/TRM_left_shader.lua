require "love.filesystem"
local thread_text = {}
local thread_common = require "threads/thread_common"
thread_common.read_text_list({
    "shaders/characters/TRM/drive_sys_chain_fade.glsl",
    "shaders/characters/TRM/6SP_P_arua.glsl"
},thread_text)
love.thread.getChannel('thread_data_14'):push({["__text"] = thread_text})