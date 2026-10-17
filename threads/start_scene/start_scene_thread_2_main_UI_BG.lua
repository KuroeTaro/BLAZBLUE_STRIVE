local image_module = require "love.image"
local compress_module = image_module.newCompressedData
local thread_data = {}
-- BG loop image table
for i = 1,50 do
    thread_data[i] = compress_module("asset/start_scene/texture/BG_loop/"..(i - 1)..".dds")
end
-- shutter to sub UI
thread_data[51] = compress_module("asset/start_scene/texture/main/shutter.dds")
love.thread.getChannel('thread_data_2'):push(thread_data)