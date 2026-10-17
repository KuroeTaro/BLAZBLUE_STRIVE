local image_module = require "love.image"
local compress_module = image_module.newCompressedData
local thread_data = {}
thread_data["lets_dance_sprite_batch"] = compress_module("asset/game_scene/common/texture/lets_dance.dds")
love.thread.getChannel('thread_data_4'):push(thread_data)