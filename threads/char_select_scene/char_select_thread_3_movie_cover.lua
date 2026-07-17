local filesys_module = require "love.filesystem"
local image_module = require "love.image"
local auido_module = require "love.sound"
local compress_module = image_module.newCompressedData
local non_compress_module = image_module.newImageData
local sound_module = auido_module.newSoundData
local thread_data = {}
-- movie_cover
-- for i = 1,10 do
--     thread_data[i] = compress_module("asset/char_select_scene/movie_cover/"..(i-1)..".dds")
-- end
thread_data["movie_cover"] = compress_module("asset/char_select_scene/movie_cover.dds")
love.thread.getChannel( 'thread_data_3' ):push( thread_data )
