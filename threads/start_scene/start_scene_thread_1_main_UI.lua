local filesys_module = require "love.filesystem"
local image_module = require "love.image"
local compress_module = image_module.newCompressedData
local image_data = {}

-- global use shape image
image_data[1] = compress_module("asset/start_scene/scene_global/dabo_trig.dds")
image_data[2] = compress_module("asset/start_scene/scene_global/type_in_mark.dds")

-- up console text image
image_data[3] = compress_module("asset/start_scene/console/up/training.dds")
image_data[4] = compress_module("asset/start_scene/console/up/matching.dds")
image_data[5] = compress_module("asset/start_scene/console/up/adjustment_interface.dds")
image_data[6] = compress_module("asset/start_scene/console/up/game_duretion.dds")
image_data[7] = compress_module("asset/start_scene/console/up/close_this_game.dds")
image_data[8] = compress_module("asset/start_scene/console/up/update_controller.dds")

-- down console text image
image_data[9] = compress_module("asset/start_scene/console/down/training_mode.dds")
image_data[10] = compress_module("asset/start_scene/console/down/second_controller.dds")
image_data[11] = compress_module("asset/start_scene/console/down/some_configuration.dds")
image_data[12] = compress_module("asset/start_scene/console/down/time_management.dds")
image_data[13] = compress_module("asset/start_scene/console/down/return_to_OS.dds")
image_data[14] = compress_module("asset/start_scene/console/down/match_mode_available.dds")
image_data[15] = compress_module("asset/start_scene/console/down/local_match.dds")
image_data[16] = compress_module("asset/start_scene/console/down/two_or_more_controller.dds")

-- option text image
image_data[17] = compress_module("asset/start_scene/option/training.dds")
image_data[18] = compress_module("asset/start_scene/option/matching.dds")
image_data[19] = compress_module("asset/start_scene/option/config.dds")
image_data[20] = compress_module("asset/start_scene/option/record.dds")
image_data[21] = compress_module("asset/start_scene/option/exit_to_OS.dds")

-- option breath tag
image_data[22] = compress_module("asset/start_scene/option/breath_tag.dds")

-- main logo
image_data[23] = compress_module("asset/start_scene/main/main_logo.dds")
image_data[24] = compress_module("asset/start_scene/main/PRESS_ANY_KEY.dds")

love.thread.getChannel( 'image_1' ):push( image_data )