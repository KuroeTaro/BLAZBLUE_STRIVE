local filesys_module = require "love.filesystem"
local image_module = require "love.image"
local compress_module = image_module.newCompressedData
local image_data = {}

-- resolution text in config resolution sub UI only
image_data[1] = compress_module("asset/start_scene/config/1280_x_720.dds")
image_data[2] = compress_module("asset/start_scene/config/1600_x_900.dds")
image_data[3] = compress_module("asset/start_scene/config/1920_x_1080.dds")
image_data[4] = compress_module("asset/start_scene/config/2560_x_1440.dds")
image_data[5] = compress_module("asset/start_scene/config/3840_x_2160.dds")
image_data[6] = compress_module("asset/start_scene/config/select_res_text.dds")

-- audio text in config audio sub UI only
image_data[7] = compress_module("asset/start_scene/config/bar.dds")
image_data[8] = compress_module("asset/start_scene/config/audio_config_text.dds")

-- controller text in config controller sub UI only
image_data[9] = compress_module("asset/start_scene/config/controller_indi_text.dds")

-- global config menu sub UI text
image_data[10] = compress_module("asset/start_scene/config/config_menu_text.dds")

-- global config menu sub UI shape
image_data[11] = compress_module("asset/start_scene/config/bar_mark.dds")

-- record text in config record sub UI only
image_data[12] = compress_module("asset/start_scene/record/game_duration_text.dds")
for i = 13,22 do
    image_data[i] = compress_module("asset/start_scene/record/number/"..(i-13)..".dds")
end
image_data[23] = compress_module("asset/start_scene/record/time_indi_barcode.dds")

love.thread.getChannel( 'image_3' ):push( image_data )