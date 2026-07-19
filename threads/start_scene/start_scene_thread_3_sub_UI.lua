local filesys_module = require "love.filesystem"
local image_module = require "love.image"
local auido_module = require "love.sound"
local compress_module = image_module.newCompressedData
local non_compress_module = image_module.newImageData
local sound_module = auido_module.newSoundData
local thread_data = {}
-- resolution text in config resolution sub UI only
thread_data[1] = compress_module("asset/start_scene/texture/config/1280_x_720.dds")
thread_data[2] = compress_module("asset/start_scene/texture/config/1600_x_900.dds")
thread_data[3] = compress_module("asset/start_scene/texture/config/1920_x_1080.dds")
thread_data[4] = compress_module("asset/start_scene/texture/config/2560_x_1440.dds")
thread_data[5] = compress_module("asset/start_scene/texture/config/3840_x_2160.dds")
thread_data[6] = compress_module("asset/start_scene/texture/config/select_res_text.dds")
-- audio text in config audio sub UI only
thread_data[7] = compress_module("asset/start_scene/texture/config/bar.dds")
thread_data[8] = compress_module("asset/start_scene/texture/config/audio_config_text.dds")
-- controller text in config controller sub UI only
thread_data[9] = compress_module("asset/start_scene/texture/config/controller_indi_text.dds")
-- global config menu sub UI text
thread_data[10] = compress_module("asset/start_scene/texture/config/config_menu_text.dds")
-- global config menu sub UI shape
thread_data[11] = compress_module("asset/start_scene/texture/config/bar_mark.dds")
-- record text in config record sub UI only
thread_data[12] = compress_module("asset/start_scene/texture/record/game_duration_text.dds")
for i = 13,22 do
    thread_data[i] = compress_module("asset/start_scene/texture/record/number/"..(i-13)..".dds")
end
thread_data[23] = compress_module("asset/start_scene/texture/record/time_indi_barcode.dds")
love.thread.getChannel( 'thread_data_3' ):push( thread_data )
