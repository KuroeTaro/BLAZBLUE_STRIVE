local filesys_module = require "love.filesystem"
local image_module = require "love.image"
local compress_module = image_module.newCompressedData
local non_compress_module = love.image.newImageData
local image_data = {}

-- first ring
-- for i = 1,111 do
--     image_data[i] = compress_module("asset/char_select_scene/scene_start_0_110f/"..(i-1)..".dds")
-- end

image_data["scene_start_0_110f"] = compress_module("asset/char_select_scene/scene_start_0_110f.dds")

love.thread.getChannel( 'image_2' ):push( image_data )