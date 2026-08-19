local filesys_module = require "love.filesystem"
local image_module = require "love.image"
local auido_module = require "love.sound"
local compress_module = image_module.newCompressedData
local non_compress_module = image_module.newImageData
local sound_module = auido_module.newSoundData
local thread_data = {}
-- HUD_VFX
thread_data["HUD_punish"] = non_compress_module("asset/game_scene/common/texture/VFX/HUD_VFX/PUINISH_HUD_VFX.png")
thread_data["HUD_counter_ver0_2"] = compress_module("asset/game_scene/common/texture/VFX/HUD_VFX/_counter_VFX/HUD_counter_ver0_2.dds")
thread_data["HUD_counter_ver3"] = compress_module("asset/game_scene/common/texture/VFX/HUD_VFX/_counter_VFX/HUD_counter_ver3.dds")
thread_data["HUD_positive_bouns_LP"] = compress_module("asset/game_scene/common/texture/VFX/HUD_VFX/_positive_bonus_VFX/HUD_positive_bouns_LP.dds")
thread_data["HUD_positive_bouns_RP"] = compress_module("asset/game_scene/common/texture/VFX/HUD_VFX/_positive_bonus_VFX/HUD_positive_bouns_RP.dds")
love.thread.getChannel( 'thread_data_5' ):push( thread_data )
