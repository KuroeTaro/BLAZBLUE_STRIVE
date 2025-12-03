local filesys_module = require "love.filesystem"
local image_module = require "love.image"
local compress_module = image_module.newCompressedData
local non_compress_module = love.image.newImageData
local image_data = {}
local image = nil

image_data["lets_dance_sprite_batch"] = compress_module("asset/game_scene/common/lets_dance.dds")

love.thread.getChannel( 'image_7' ):push( image_data )