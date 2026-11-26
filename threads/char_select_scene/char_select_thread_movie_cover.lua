require "love.filesystem"
local thread_text = {}
local thread_data = {}
local thread_common = require "threads.thread_common"
local compress_module = thread_common.with_sibling_json(thread_common.new_compressed_data,thread_text)
thread_data["movie_cover"] = compress_module("asset/char_select_scene/texture/movie_cover.dds")
thread_data["__text"] = thread_text
love.thread.getChannel('thread_data_4'):push(thread_data)
