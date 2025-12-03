local filesys_module = require "love.filesystem"
local image_module = require "love.image"
local compress_module = image_module.newCompressedData
local non_compress_module = love.image.newImageData
local image_data = {}
local image = nil

image_data["HUD_ease_in_sprite_batch"] = compress_module("asset/game_scene/common/HUD/HUD_ease_in.dds")
image_data["HUD_common_sprite_batch"] = non_compress_module("asset/game_scene/common/HUD/HUD_common.png")
image_data["HUD_background_gauge"] = compress_module("asset/game_scene/common/HUD/HUD_background_gauge.dds")

love.thread.getChannel( 'image_6' ):push( image_data )