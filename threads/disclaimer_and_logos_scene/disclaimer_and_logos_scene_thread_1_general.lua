local image_module = require "love.image"
local compress_module = image_module.newCompressedData
local thread_data = {}
thread_data[1] = compress_module("asset/disclaimer_and_logo_scene/texture/disclaimer_text.dds")
thread_data[2] = compress_module("asset/disclaimer_and_logo_scene/texture/kuroe_taro_s_handicraft_logo.dds")
thread_data[3] = compress_module("asset/disclaimer_and_logo_scene/texture/love_framework_logo.dds")
love.thread.getChannel('thread_data_1'):push(thread_data)