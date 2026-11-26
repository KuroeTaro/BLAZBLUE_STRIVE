require "love.filesystem"
local thread_text = {}
local thread_data = {}
local thread_common = require "threads/thread_common"
local compress_module = thread_common.with_sibling_json(thread_common.new_compressed_data,thread_text)
thread_data["scene_start_0_110f"] = compress_module("asset/char_select_scene/texture/scene_start_0_110f.dds")
thread_data["__text"] = thread_text
love.thread.getChannel('thread_data_3'):push(thread_data)
