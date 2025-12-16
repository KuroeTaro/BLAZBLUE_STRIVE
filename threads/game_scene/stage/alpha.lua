local filesys_module = require "love.filesystem"
local image_module = require "love.image"
local auido_module = require "love.sound"
local compress_module = image_module.newCompressedData
local non_compress_module = image_module.newImageData
local sound_module = auido_module.newSoundData
local thread_data = {}

thread_data[1] = compress_module("asset/game_scene/stage/alpha/ground.dds")
thread_data[2] = compress_module("asset/game_scene/stage/alpha/stair.dds")
thread_data[3] = compress_module("asset/game_scene/stage/alpha/stage_liner_fade.dds")
thread_data[4] = compress_module("asset/game_scene/stage/alpha/tile_map.dds")
love.thread.getChannel( 'thread_data_4' ):push( thread_data )