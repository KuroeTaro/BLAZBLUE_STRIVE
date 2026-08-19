local filesys_module = require "love.filesystem"
local image_module = require "love.image"
local auido_module = require "love.sound"
local compress_module = image_module.newCompressedData
local non_compress_module = image_module.newImageData
local sound_module = auido_module.newSoundData
local thread_data = {}
thread_data["lets_dance_sprite_batch"] = compress_module("asset/game_scene/common/texture/lets_dance.dds")
love.thread.getChannel( 'thread_data_5' ):push( thread_data )
