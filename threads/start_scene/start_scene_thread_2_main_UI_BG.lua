local filesys_module = require "love.filesystem"
local image_module = require "love.image"
local auido_module = require "love.sound"
local compress_module = image_module.newCompressedData
local non_compress_module = image_module.newImageData
local sound_module = auido_module.newSoundData
local thread_data = {}

-- BG loop image table
for i = 1,50 do
    thread_data[i] = compress_module("asset/start_scene/BG_loop/"..(i-1)..".dds")
end
-- shutter to sub UI
thread_data[51] = compress_module("asset/start_scene/main/shutter.dds")

love.thread.getChannel( 'thread_data_2' ):push( thread_data )