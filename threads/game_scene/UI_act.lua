require "love.filesystem"
local thread_text = {}
local thread_data = {}
local thread_common = require "threads/thread_common"
local image_module = require "love.image"
local compress_module = thread_common.with_sibling_json(thread_common.new_compressed_data,thread_text)
thread_data["act_common_sprite_batch"] = compress_module("asset/game_scene/common/texture/act_common.dds")
thread_data["act_1_sprite_batch"] = compress_module("asset/game_scene/common/texture/act_1.dds")
thread_data["act_2_sprite_batch"] = compress_module("asset/game_scene/common/texture/act_2.dds")
thread_data["act_3_sprite_batch"] = compress_module("asset/game_scene/common/texture/act_3.dds")
thread_data["__text"] = thread_text
love.thread.getChannel('thread_data_3'):push(thread_data)