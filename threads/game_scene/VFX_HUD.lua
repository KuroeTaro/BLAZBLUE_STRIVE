require "love.filesystem"
local thread_text = {}
local thread_data = {}
local thread_common = require "threads.thread_common"
local image_module = require "love.image"
local compress_module = thread_common.with_sibling_json(thread_common.new_compressed_data,thread_text)
local non_compress_module = thread_common.with_sibling_json(image_module.newImageData,thread_text)
-- HUD_VFX
thread_data["HUD_punish"] = non_compress_module("asset/game_scene/common/texture/VFX/HUD_VFX/PUINISH_HUD_VFX.png")
thread_data["HUD_counter_ver0_2"] =
compress_module("asset/game_scene/common/texture/VFX/HUD_VFX/_counter_VFX/HUD_counter_ver0_2.dds")
thread_data["HUD_counter_ver3"] =
compress_module("asset/game_scene/common/texture/VFX/HUD_VFX/_counter_VFX/HUD_counter_ver3.dds")
thread_data["__text"] = thread_text
love.thread.getChannel('thread_data_7'):push(thread_data)