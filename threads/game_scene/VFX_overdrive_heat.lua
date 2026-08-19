local filesys_module = require "love.filesystem"
local image_module = require "love.image"
local auido_module = require "love.sound"
local compress_module = image_module.newCompressedData
local non_compress_module = image_module.newImageData
local sound_module = auido_module.newSoundData
local thread_data = {}
-- overdrive_VFX
thread_data["overdrive_airflow_sprite_batch"] = compress_module("asset/game_scene/common/texture/VFX/overdrive_airflow.dds")
thread_data["overdrive_partical_sprite_batch"] = compress_module("asset/game_scene/common/texture/VFX/overdrive_partical.dds")
-- RC_VFX
thread_data["RC_partical_sprite_batch"] = compress_module("asset/game_scene/common/texture/VFX/RC_partical.dds")
thread_data["RC_shockwave_sprite_batch"] = compress_module("asset/game_scene/common/texture/VFX/RC_shockwave.dds")
thread_data["RC_blue_badge_sprite_batch"] = compress_module("asset/game_scene/common/texture/VFX/RC_blue_badge.dds")
thread_data["RC_purple_badge_sprite_batch"] = compress_module("asset/game_scene/common/texture/VFX/RC_purple_badge.dds")
thread_data["RC_red_badge_sprite_batch"] = compress_module("asset/game_scene/common/texture/VFX/RC_red_badge.dds")
thread_data["RC_yellow_badge_sprite_batch"] = compress_module("asset/game_scene/common/texture/VFX/RC_yellow_badge.dds")
-- UA_VFX
thread_data["UA_common_sprite_batch"] = compress_module("asset/game_scene/common/texture/VFX/UA_common.dds")
-- burst_VFX
thread_data["burst_back_sprite_batch"] = compress_module("asset/game_scene/common/texture/VFX/burst_VFX/burst_back.dds")
thread_data["burst_front_sprite_batch"] = compress_module("asset/game_scene/common/texture/VFX/burst_VFX/burst_front.dds")
thread_data["burst_ring"] = compress_module("asset/game_scene/common/texture/VFX/burst_VFX/burst_ring.dds")
love.thread.getChannel( 'thread_data_7' ):push( thread_data )
