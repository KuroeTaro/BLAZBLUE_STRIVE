local filesys_module = require "love.filesystem"
local image_module = require "love.image"
local auido_module = require "love.sound"
local compress_module = image_module.newCompressedData
local non_compress_module = image_module.newImageData
local sound_module = auido_module.newSoundData
local thread_data = {}

-- first ring
-- for i = 1,111 do
--     thread_data[i] = compress_module("asset/char_select_scene/scene_start_0_110f/"..(i-1)..".dds")
-- end

thread_data["scene_start_0_110f"] = compress_module("asset/char_select_scene/scene_start_0_110f.dds")

love.thread.getChannel( 'thread_data_2' ):push( thread_data )