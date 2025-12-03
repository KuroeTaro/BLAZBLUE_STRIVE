local filesys_module = require "love.filesystem"
local image_module = require "love.image"
local compress_module = image_module.newCompressedData
local non_compress_module = love.image.newImageData
local image_data = {}
local image = nil

image_data["act_common_sprite_batch"] = compress_module("asset/game_scene/common/act_common.dds")
image_data["act_1_sprite_batch"] = compress_module("asset/game_scene/common/act_1.dds")
image_data["act_2_sprite_batch"] = compress_module("asset/game_scene/common/act_2.dds")
image_data["act_3_sprite_batch"] = compress_module("asset/game_scene/common/act_3.dds")

love.thread.getChannel( 'image_5' ):push( image_data )