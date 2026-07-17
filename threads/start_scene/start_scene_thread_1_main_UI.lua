local filesys_module = require "love.filesystem"
local image_module = require "love.image"
local auido_module = require "love.sound"
local compress_module = image_module.newCompressedData
local non_compress_module = image_module.newImageData
local sound_module = auido_module.newSoundData
local thread_data = {}
-- global use shape image
thread_data[1] = compress_module("asset/start_scene/scene_global/dabo_trig.dds")
thread_data[2] = compress_module("asset/start_scene/scene_global/type_in_mark.dds")
-- up console text image
thread_data[3] = compress_module("asset/start_scene/console/up/training.dds")
thread_data[4] = compress_module("asset/start_scene/console/up/matching.dds")
thread_data[5] = compress_module("asset/start_scene/console/up/adjustment_interface.dds")
thread_data[6] = compress_module("asset/start_scene/console/up/game_duretion.dds")
thread_data[7] = compress_module("asset/start_scene/console/up/close_this_game.dds")
thread_data[8] = compress_module("asset/start_scene/console/up/update_controller.dds")
-- down console text image
thread_data[9] = compress_module("asset/start_scene/console/down/training_mode.dds")
thread_data[10] = compress_module("asset/start_scene/console/down/second_controller.dds")
thread_data[11] = compress_module("asset/start_scene/console/down/some_configuration.dds")
thread_data[12] = compress_module("asset/start_scene/console/down/time_management.dds")
thread_data[13] = compress_module("asset/start_scene/console/down/return_to_OS.dds")
thread_data[14] = compress_module("asset/start_scene/console/down/match_mode_available.dds")
thread_data[15] = compress_module("asset/start_scene/console/down/local_match.dds")
thread_data[16] = compress_module("asset/start_scene/console/down/two_or_more_controller.dds")
-- option text image
thread_data[17] = compress_module("asset/start_scene/option/training.dds")
thread_data[18] = compress_module("asset/start_scene/option/matching.dds")
thread_data[19] = compress_module("asset/start_scene/option/config.dds")
thread_data[20] = compress_module("asset/start_scene/option/record.dds")
thread_data[21] = compress_module("asset/start_scene/option/exit_to_OS.dds")
-- option breath tag
thread_data[22] = compress_module("asset/start_scene/option/breath_tag.dds")
-- main logo
thread_data[23] = compress_module("asset/start_scene/main/main_logo.dds")
thread_data[24] = compress_module("asset/start_scene/main/PRESS_ANY_KEY.dds")
love.thread.getChannel( 'thread_data_1' ):push( thread_data )
