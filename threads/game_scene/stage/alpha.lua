local filesys_module = require "love.filesystem"
local image_module = require "love.image"
local compress_module = image_module.newCompressedData
local non_compress_module = love.image.newImageData
local image_data = {}

image_data[1] = compress_module("asset/game_scene/stage/alpha/ground.dds")
image_data[2] = compress_module("asset/game_scene/stage/alpha/stair.dds")
image_data[3] = compress_module("asset/game_scene/stage/alpha/stage_liner_fade.dds")
image_data[4] = compress_module("asset/game_scene/stage/alpha/tile_map.dds")
love.thread.getChannel( 'image_4' ):push( image_data )