local filesys_module = require "love.filesystem"
local image_module = require "love.image"
local compress_module = image_module.newCompressedData
local image_data = {}

-- movie_cover
-- for i = 1,10 do
--     image_data[i] = compress_module("asset/char_select_scene/movie_cover/"..(i-1)..".dds")
-- end

image_data["movie_cover"] = compress_module("asset/char_select_scene/movie_cover.dds")

love.thread.getChannel( 'image_3' ):push( image_data )