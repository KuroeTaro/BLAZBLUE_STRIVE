local filesys_module = require "love.filesystem"
local image_module = require "love.image"
local auido_module = require "love.sound"
local compress_module = image_module.newCompressedData
local non_compress_module = image_module.newImageData
local sound_module = auido_module.newSoundData
local thread_data = {}

thread_data[1] = compress_module("asset/disclaimer_and_logo_scene/disclaimer_text.dds")
thread_data[2] = compress_module("asset/disclaimer_and_logo_scene/kuroe_taro_s_handicraft_logo.dds")
thread_data[3] = compress_module("asset/disclaimer_and_logo_scene/love_framework_logo.dds")

love.thread.getChannel( 'thread_data_1' ):push( thread_data )