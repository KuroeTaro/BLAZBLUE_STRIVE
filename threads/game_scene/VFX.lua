local filesys_module = require "love.filesystem"
local image_module = require "love.image"
local auido_module = require "love.sound"
local compress_module = image_module.newCompressedData
local non_compress_module = image_module.newImageData
local sound_module = auido_module.newSoundData
local thread_data = {}
-- common
thread_data["overdrive_airflow_sprite_batch"] = compress_module("asset/game_scene/common/texture/VFX/overdrive_airflow.dds")
thread_data["overdrive_partical_sprite_batch"] = compress_module("asset/game_scene/common/texture/VFX/overdrive_partical.dds")
thread_data["RC_partical_sprite_batch"] = compress_module("asset/game_scene/common/texture/VFX/RC_partical.dds")
thread_data["RC_shockwave_sprite_batch"] = compress_module("asset/game_scene/common/texture/VFX/RC_shockwave.dds")
thread_data["RC_blue_badge_sprite_batch"] = compress_module("asset/game_scene/common/texture/VFX/RC_blue_badge.dds")
thread_data["RC_purple_badge_sprite_batch"] = compress_module("asset/game_scene/common/texture/VFX/RC_purple_badge.dds")
thread_data["RC_red_badge_sprite_batch"] = compress_module("asset/game_scene/common/texture/VFX/RC_red_badge.dds")
thread_data["RC_yellow_badge_sprite_batch"] = compress_module("asset/game_scene/common/texture/VFX/RC_yellow_badge.dds")
thread_data["UA_common_sprite_batch"] = compress_module("asset/game_scene/common/texture/VFX/UA_common.dds")
-- burst_VFX
thread_data["burst_back_sprite_batch"] = compress_module("asset/game_scene/common/texture/VFX/burst_VFX/burst_back.dds")
thread_data["burst_front_sprite_batch"] = compress_module("asset/game_scene/common/texture/VFX/burst_VFX/burst_front.dds")
thread_data["burst_ring"] = compress_module("asset/game_scene/common/texture/VFX/burst_VFX/burst_ring.dds")
-- hit_VFX
thread_data["air_blow_sprite_batch"] = compress_module("asset/game_scene/common/texture/VFX/hit_VFX/air_blow.dds")
thread_data["blast_ver0_sprite_batch"] = compress_module("asset/game_scene/common/texture/VFX/hit_VFX/blast_ver0.dds")
thread_data["blast_ver0_counter_sprite_batch"] = compress_module("asset/game_scene/common/texture/VFX/hit_VFX/blast_ver0_counter.dds")
thread_data["blast_ver1_sprite_batch"] = compress_module("asset/game_scene/common/texture/VFX/hit_VFX/blast_ver1.dds")
thread_data["block_FD_sprite_batch"] = compress_module("asset/game_scene/common/texture/VFX/hit_VFX/block_FD.dds")
thread_data["block_ver0_sprite_batch"] = compress_module("asset/game_scene/common/texture/VFX/hit_VFX/block_ver0.dds")
thread_data["block_ver1_sprite_batch"] = compress_module("asset/game_scene/common/texture/VFX/hit_VFX/block_ver1.dds")
thread_data["counter_glow"] = compress_module("asset/game_scene/common/texture/VFX/hit_VFX/counter_glow.dds")
thread_data["FD_bubble"] = compress_module("asset/game_scene/common/texture/VFX/hit_VFX/FD_bubble.dds")
thread_data["partical_ver1_counter_sprite_batch"] = compress_module("asset/game_scene/common/texture/VFX/hit_VFX/partical_ver1_counter.dds")
thread_data["slash_ver0_sprite_batch"] = compress_module("asset/game_scene/common/texture/VFX/hit_VFX/slash_ver0.dds")
thread_data["slash_ver0_counter_sprite_batch"] = compress_module("asset/game_scene/common/texture/VFX/hit_VFX/slash_ver0_counter.dds")
thread_data["slash_ver1_sprite_batch"] = compress_module("asset/game_scene/common/texture/VFX/hit_VFX/slash_ver1.dds")
thread_data["throw_tech_sprite_batch"] = compress_module("asset/game_scene/common/texture/VFX/hit_VFX/throw_tech.dds")
    -- special
thread_data["special_lighting_0_sprite_batch"] = compress_module("asset/game_scene/common/texture/VFX/hit_VFX/_special/lighting_0.dds")
thread_data["special_lighting_1_sprite_batch"] = compress_module("asset/game_scene/common/texture/VFX/hit_VFX/_special/lighting_1.dds")
thread_data["special_radial_sprite_batch"] = compress_module("asset/game_scene/common/texture/VFX/hit_VFX/_special/radial.dds")
-- HUD_VFX
thread_data["HUD_punish"] = non_compress_module("asset/game_scene/common/texture/VFX/HUD_VFX/PUINISH_HUD_VFX.png")
    -- counter
thread_data["HUD_counter_ver0_2"] = compress_module("asset/game_scene/common/texture/VFX/HUD_VFX/_counter_VFX/HUD_counter_ver0_2.dds")
thread_data["HUD_counter_ver3"] = compress_module("asset/game_scene/common/texture/VFX/HUD_VFX/_counter_VFX/HUD_counter_ver3.dds")
    -- positive_bouns
thread_data["HUD_positive_bouns_LP"] = compress_module("asset/game_scene/common/texture/VFX/HUD_VFX/_positive_bonus_VFX/HUD_positive_bouns_LP.dds")
thread_data["HUD_positive_bouns_RP"] = compress_module("asset/game_scene/common/texture/VFX/HUD_VFX/_positive_bonus_VFX/HUD_positive_bouns_RP.dds")
love.thread.getChannel( 'thread_data_2' ):push( thread_data )
