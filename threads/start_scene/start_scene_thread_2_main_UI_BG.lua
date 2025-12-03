local filesys_module = require "love.filesystem"
local image_module = require "love.image"
local compress_module = image_module.newCompressedData
local image_data = {}

-- BG loop image table
for i = 1,50 do
    image_data[i] = compress_module("asset/start_scene/BG_loop/"..(i-1)..".dds")
end
-- shutter to sub UI
image_data[51] = compress_module("asset/start_scene/main/shutter.dds")

love.thread.getChannel( 'image_2' ):push( image_data )