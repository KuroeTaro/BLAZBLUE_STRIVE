local filesys_module = require "love.filesystem"
local image_module = require "love.image"
local compress_module = image_module.newCompressedData
local non_compress_module = love.image.newImageData
local image_data = {}

image_data["movie_cover_sprite_batch"] = compress_module("asset/game_scene/common/movie_cover.dds")

love.thread.getChannel( 'image_1' ):push( image_data )