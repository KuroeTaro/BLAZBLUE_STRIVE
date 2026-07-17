local filesys_module = require "love.filesystem"
local image_module = require "love.image"
local auido_module = require "love.sound"
local compress_module = image_module.newCompressedData
local non_compress_module = image_module.newImageData
local sound_module = auido_module.newSoundData
local thread_data = {}
-- global use shape image
thread_data[1] = compress_module("asset/char_select_scene/bar_mark.dds")
thread_data[2] = compress_module("asset/char_select_scene/char_select_left_alpha.dds")
thread_data[3] = compress_module("asset/char_select_scene/char_select_right_alpha.dds")
thread_data[4] = compress_module("asset/char_select_scene/control_method_L.dds")
thread_data[5] = compress_module("asset/char_select_scene/control_method_R.dds")
thread_data[6] = compress_module("asset/char_select_scene/ring.dds")
-- char_icon_alpha
thread_data["char_icon_alpha"] = {}
thread_data["char_icon_alpha"][1] = compress_module("asset/char_select_scene/char_icon_alpha/1.dds")
thread_data["char_icon_alpha"][2] = compress_module("asset/char_select_scene/char_icon_alpha/2.dds")
thread_data["char_icon_alpha"][3] = compress_module("asset/char_select_scene/char_icon_alpha/3.dds")
thread_data["char_icon_alpha"][4] = compress_module("asset/char_select_scene/char_icon_alpha/4.dds")
thread_data["char_icon_alpha"][5] = compress_module("asset/char_select_scene/char_icon_alpha/5.dds")
thread_data["char_icon_alpha"][6] = compress_module("asset/char_select_scene/char_icon_alpha/6.dds")
thread_data["char_icon_alpha"][7] = compress_module("asset/char_select_scene/char_icon_alpha/7.dds")
thread_data["char_icon_alpha"][8] = compress_module("asset/char_select_scene/char_icon_alpha/8.dds")
-- char_select
thread_data["char_select_char"] = {}
thread_data["char_select_char"][1] = compress_module("asset/char_select_scene/char_select/PLT.dds")
thread_data["char_select_char"][2] = compress_module("asset/char_select_scene/char_select/AZR.dds")
thread_data["char_select_char"][3] = compress_module("asset/char_select_scene/char_select/SSN.dds")
thread_data["char_select_char"][4] = compress_module("asset/char_select_scene/char_select/TRM.dds")
thread_data["char_select_char"][5] = compress_module("asset/char_select_scene/char_select/RGN.dds")
thread_data["char_select_char"][6] = compress_module("asset/char_select_scene/char_select/SRK.dds")
thread_data["char_select_char"][7] = compress_module("asset/char_select_scene/char_select/KGR.dds")
thread_data["char_select_char"][8] = compress_module("asset/char_select_scene/char_select/TGR.dds")
thread_data["char_select_char_txt"] = {}
thread_data["char_select_char_txt"][1] = compress_module("asset/char_select_scene/char_select/PLT_text.dds")
thread_data["char_select_char_txt"][2] = compress_module("asset/char_select_scene/char_select/AZR_text.dds")
thread_data["char_select_char_txt"][3] = compress_module("asset/char_select_scene/char_select/SSN_text.dds")
thread_data["char_select_char_txt"][4] = compress_module("asset/char_select_scene/char_select/TRM_text.dds")
thread_data["char_select_char_txt"][5] = compress_module("asset/char_select_scene/char_select/RGN_text.dds")
thread_data["char_select_char_txt"][6] = compress_module("asset/char_select_scene/char_select/SRK_text.dds")
thread_data["char_select_char_txt"][7] = compress_module("asset/char_select_scene/char_select/KGR_text.dds")
thread_data["char_select_char_txt"][8] = compress_module("asset/char_select_scene/char_select/TGR_text.dds")
-- number
thread_data["number"] = {}
thread_data["number"][0] = compress_module("asset/char_select_scene/number/0.dds")
thread_data["number"][1] = compress_module("asset/char_select_scene/number/1.dds")
thread_data["number"][2] = compress_module("asset/char_select_scene/number/2.dds")
thread_data["number"][3] = compress_module("asset/char_select_scene/number/3.dds")
thread_data["number"][4] = compress_module("asset/char_select_scene/number/4.dds")
thread_data["number"][5] = compress_module("asset/char_select_scene/number/5.dds")
thread_data["number"][6] = compress_module("asset/char_select_scene/number/6.dds")
thread_data["number"][7] = compress_module("asset/char_select_scene/number/7.dds")
thread_data["number"][8] = compress_module("asset/char_select_scene/number/8.dds")
thread_data["number"][9] = compress_module("asset/char_select_scene/number/9.dds")
love.thread.getChannel( 'thread_data_1' ):push( thread_data )
