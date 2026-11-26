require "love.filesystem"
local thread_text = {}
local thread_data = {}
local thread_common = require "threads/thread_common"
local image_module = require "love.image"
local compress_module = thread_common.with_sibling_json(thread_common.new_compressed_data,thread_text)
local non_compress_module = thread_common.with_sibling_json(image_module.newImageData,thread_text)
thread_data["HUD_ease_in_sprite_batch"] = compress_module("asset/game_scene/common/texture/HUD/HUD_ease_in.dds")
thread_data["HUD_common_sprite_batch"] = non_compress_module("asset/game_scene/common/texture/HUD/HUD_common.png")
thread_data["HUD_background_gauge"] = compress_module("asset/game_scene/common/texture/HUD/HUD_background_gauge.dds")
thread_data["__text"] = thread_text
love.thread.getChannel('thread_data_4'):push(thread_data)