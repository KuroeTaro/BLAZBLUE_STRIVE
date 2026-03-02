local filesys_module = require "love.filesystem"
local image_module = require "love.image"
local auido_module = require "love.sound"
local compress_module = image_module.newCompressedData
local non_compress_module = image_module.newImageData
local sound_module = auido_module.newSoundData
local thread_data = {}

-- common
thread_data["overdrive_airflow_sprite_batch"] = compress_module("asset/game_scene/VFX/overdrive_airflow.dds")
thread_data["overdrive_partical_sprite_batch"] = compress_module("asset/game_scene/VFX/overdrive_partical.dds")
thread_data["UA_common_sprite_batch"] = compress_module("asset/game_scene/VFX/UA_common.dds")

-- burst_VFX
thread_data["burst_back_sprite_batch"] = compress_module("asset/game_scene/VFX/burst_VFX/burst_back.dds")
thread_data["burst_front_sprite_batch"] = compress_module("asset/game_scene/VFX/burst_VFX/burst_front.dds")
thread_data["burst_ring"] = compress_module("asset/game_scene/VFX/burst_VFX/burst_ring.dds")

-- hit_VFX
thread_data["air_blow_sprite_batch"] = compress_module("asset/game_scene/VFX/hit_VFX/air_blow.dds")
thread_data["blast_ver0_sprite_batch"] = compress_module("asset/game_scene/VFX/hit_VFX/blast_ver0.dds")
thread_data["blast_ver0_counter_sprite_batch"] = compress_module("asset/game_scene/VFX/hit_VFX/blast_ver0_counter.dds")
thread_data["blast_ver1_sprite_batch"] = compress_module("asset/game_scene/VFX/hit_VFX/blast_ver1.dds")
thread_data["block_FD_sprite_batch"] = compress_module("asset/game_scene/VFX/hit_VFX/block_FD.dds")
thread_data["block_ver0_sprite_batch"] = compress_module("asset/game_scene/VFX/hit_VFX/block_ver0.dds")
thread_data["block_ver1_sprite_batch"] = compress_module("asset/game_scene/VFX/hit_VFX/block_ver1.dds")
thread_data["counter_glow"] = compress_module("asset/game_scene/VFX/hit_VFX/counter_glow.dds")
thread_data["FD_bubble"] = compress_module("asset/game_scene/VFX/hit_VFX/FD_bubble.dds")
thread_data["partical_ver1_counter_sprite_batch"] = compress_module("asset/game_scene/VFX/hit_VFX/partical_ver1_counter.dds")
thread_data["slash_ver0_sprite_batch"] = compress_module("asset/game_scene/VFX/hit_VFX/slash_ver0.dds")
thread_data["slash_ver0_counter_sprite_batch"] = compress_module("asset/game_scene/VFX/hit_VFX/slash_ver0_counter.dds")
thread_data["slash_ver1_sprite_batch"] = compress_module("asset/game_scene/VFX/hit_VFX/slash_ver1.dds")
thread_data["throw_tech_sprite_batch"] = compress_module("asset/game_scene/VFX/hit_VFX/throw_tech.dds")
    -- special
thread_data["lighting_black_0_sprite_batch"] = compress_module("asset/game_scene/VFX/hit_VFX/special/lighting_black_0.dds")
thread_data["lighting_black_1_sprite_batch"] = compress_module("asset/game_scene/VFX/hit_VFX/special/lighting_black_1.dds")
thread_data["lighting_white_0_sprite_batch"] = compress_module("asset/game_scene/VFX/hit_VFX/special/lighting_white_0.dds")
thread_data["lighting_white_1_sprite_batch"] = compress_module("asset/game_scene/VFX/hit_VFX/special/lighting_white_1.dds")
thread_data["radial_black_sprite_batch"] = compress_module("asset/game_scene/VFX/hit_VFX/special/radial_black.dds")
thread_data["radial_white_sprite_batch"] = compress_module("asset/game_scene/VFX/hit_VFX/special/radial_white.dds")

-- HUD_VFX
thread_data["HUD_punish"] = non_compress_module("asset/game_scene/VFX/HUD_VFX/PUINISH_HUD_VFX.png")
    -- counter
thread_data["HUD_counter_ver0_2"] = compress_module("asset/game_scene/VFX/HUD_VFX/counter_VFX/HUD_counter_ver0_2.dds")
thread_data["HUD_counter_ver3"] = compress_module("asset/game_scene/VFX/HUD_VFX/counter_VFX/HUD_counter_ver3.dds")
    -- positive_bouns
thread_data["HUD_positive_bouns_LP"] = compress_module("asset/game_scene/VFX/HUD_VFX/positive_bonus_VFX/HUD_positive_bouns_LP.dds")
thread_data["HUD_positive_bouns_RP"] = compress_module("asset/game_scene/VFX/HUD_VFX/positive_bonus_VFX/HUD_positive_bouns_RP.dds")

-- stage_VFX
    -- shockwave
thread_data["air_dash_shockwave"] = compress_module("asset/game_scene/VFX/stage_VFX/air_dash_shockwave.dds")
    -- smoke
thread_data["smoke_dash_burst"] = compress_module("asset/game_scene/VFX/stage_VFX/smoke/dash_burst.dds")
thread_data["smoke_horizontal_shot"] = compress_module("asset/game_scene/VFX/stage_VFX/smoke/horizontal_shot.dds")
thread_data["smoke_land_blow"] = compress_module("asset/game_scene/VFX/stage_VFX/smoke/land_blow.dds")
thread_data["smoke_vertical_shot"] = compress_module("asset/game_scene/VFX/stage_VFX/smoke/vertical_shot.dds")
    -- spark
thread_data["spark_dcc_burst"] = compress_module("asset/game_scene/VFX/stage_VFX/spark/dcc_burst.dds")
    -- wallbreak
thread_data["wallbreak"] = compress_module("asset/game_scene/VFX/stage_VFX/wallbreak.dds")

love.thread.getChannel( 'thread_data_8' ):push( thread_data )