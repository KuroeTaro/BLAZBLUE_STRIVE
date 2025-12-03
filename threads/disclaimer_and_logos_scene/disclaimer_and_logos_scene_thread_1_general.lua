local filesys_module = require "love.filesystem"
local image_module = require "love.image"
local compress_module = image_module.newCompressedData
local image_data = {}

image_data[1] = compress_module("asset/disclaimer_and_logo_scene/disclaimer_text.dds")
image_data[2] = compress_module("asset/disclaimer_and_logo_scene/kuroe_taro_s_handicraft_logo.dds")
image_data[3] = compress_module("asset/disclaimer_and_logo_scene/love_framework_logo.dds")

love.thread.getChannel( 'image_1' ):push( image_data )