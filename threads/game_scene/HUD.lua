local filesys_module = require "love.filesystem"
local image_module = require "love.image"
local auido_module = require "love.sound"
local compress_module = image_module.newCompressedData
local non_compress_module = image_module.newImageData
local sound_module = auido_module.newSoundData
local thread_data = {}
thread_data["HUD_ease_in_sprite_batch"] = compress_module("asset/game_scene/common/texture/HUD/HUD_ease_in.dds")
thread_data["HUD_common_sprite_batch"] = non_compress_module("asset/game_scene/common/texture/HUD/HUD_common.png")
thread_data["HUD_background_gauge"] = compress_module("asset/game_scene/common/texture/HUD/HUD_background_gauge.dds")
love.thread.getChannel( 'thread_data_10' ):push( thread_data )
