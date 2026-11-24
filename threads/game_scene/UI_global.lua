local filesys_module = require "love.filesystem"
local image_module = require "love.image"
local compress_module = image_module.newCompressedData
local thread_data = {}
thread_data["movie_cover_sprite_batch"] = compress_module("asset/game_scene/common/texture/movie_cover.dds")
love.thread.getChannel('thread_data_2'):push(thread_data)