local filesys_module = require "love.filesystem"
local image_module = require "love.image"
local auido_module = require "love.sound"
local compress_module = image_module.newCompressedData
local non_compress_module = image_module.newImageData
local sound_module = auido_module.newSoundData
local thread_data = {}
thread_data["act_common_sprite_batch"] = compress_module("asset/game_scene/common/act_common.dds")
thread_data["act_1_sprite_batch"] = compress_module("asset/game_scene/common/act_1.dds")
thread_data["act_2_sprite_batch"] = compress_module("asset/game_scene/common/act_2.dds")
thread_data["act_3_sprite_batch"] = compress_module("asset/game_scene/common/act_3.dds")
love.thread.getChannel( 'thread_data_5' ):push( thread_data )
