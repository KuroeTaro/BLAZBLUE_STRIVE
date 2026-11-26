local thread_text = {}
local thread_data = {}
local thread_common = require "threads/thread_common"
local filesys_module = require "love.filesystem"
local image_module = require "love.image"
local compress_module = thread_common.with_sibling_json(thread_common.new_compressed_data,thread_text)
thread_data["movie_cover_sprite_batch"] = compress_module("asset/game_scene/common/texture/movie_cover.dds")
thread_data["__text"] = thread_text
love.thread.getChannel('thread_data_2'):push(thread_data)