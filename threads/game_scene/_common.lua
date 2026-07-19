local filesys_module = require "love.filesystem"
local image_module = require "love.image"
local auido_module = require "love.sound"
local compress_module = image_module.newCompressedData
local non_compress_module = image_module.newImageData
local sound_module = auido_module.newSoundData
local thread_data = {}
thread_data["movie_cover_sprite_batch"] = compress_module("asset/game_scene/common/movie_cover.dds")
thread_data["audio_annoucer_ease_in"] = sound_module("asset/game_scene/common/audio/annoucer_ease_in.wav")
thread_data["audio_overdrive"] = sound_module("asset/game_scene/common/audio/overdrive.wav")
love.thread.getChannel( 'thread_data_1' ):push( thread_data )
