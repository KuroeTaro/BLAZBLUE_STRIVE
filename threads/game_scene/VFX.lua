local filesys_module = require "love.filesystem"
local image_module = require "love.image"
local compress_module = image_module.newCompressedData
local non_compress_module = love.image.newImageData
local image_data = {}
local image = nil

-- common
image_data["overdrive_airflow_sprite_batch"] = compress_module("asset/game_scene/VFX/overdrive_airflow.dds")
image_data["overdrive_partical_sprite_batch"] = compress_module("asset/game_scene/VFX/overdrive_partical.dds")
image_data["UA_common_sprite_batch"] = compress_module("asset/game_scene/VFX/UA_common.dds")

-- burst_VFX
image_data["burst_back_sprite_batch"] = compress_module("asset/game_scene/VFX/burst_VFX/burst_back.dds")
image_data["burst_front_sprite_batch"] = compress_module("asset/game_scene/VFX/burst_VFX/burst_front.dds")
image_data["burst_ring"] = compress_module("asset/game_scene/VFX/burst_VFX/burst_ring.dds")

-- hit_VFX
image_data["air_blow_sprite_batch"] = compress_module("asset/game_scene/VFX/hit_VFX/air_blow.dds")
image_data["blast_ver0_sprite_batch"] = compress_module("asset/game_scene/VFX/hit_VFX/blast_ver0.dds")
image_data["blast_ver0_counter_sprite_batch"] = compress_module("asset/game_scene/VFX/hit_VFX/blast_ver0_counter.dds")
image_data["blast_ver1_sprite_batch"] = compress_module("asset/game_scene/VFX/hit_VFX/blast_ver1.dds")
image_data["block_FD_sprite_batch"] = compress_module("asset/game_scene/VFX/hit_VFX/block_FD.dds")
image_data["block_ver0_sprite_batch"] = compress_module("asset/game_scene/VFX/hit_VFX/block_ver0.dds")
image_data["block_ver1_sprite_batch"] = compress_module("asset/game_scene/VFX/hit_VFX/block_ver1.dds")
image_data["counter_glow"] = compress_module("asset/game_scene/VFX/hit_VFX/counter_glow.dds")
image_data["FD_bubble"] = compress_module("asset/game_scene/VFX/hit_VFX/FD_bubble.dds")
image_data["partical_ver1_counter_sprite_batch"] = compress_module("asset/game_scene/VFX/hit_VFX/partical_ver1_counter.dds")
image_data["slash_ver0_sprite_batch"] = compress_module("asset/game_scene/VFX/hit_VFX/slash_ver0.dds")
image_data["slash_ver0_counter_sprite_batch"] = compress_module("asset/game_scene/VFX/hit_VFX/slash_ver0_counter.dds")
image_data["slash_ver1_sprite_batch"] = compress_module("asset/game_scene/VFX/hit_VFX/slash_ver1.dds")
    -- special
image_data["lighting_black_0_sprite_batch"] = compress_module("asset/game_scene/VFX/hit_VFX/special/lighting_black_0.dds")
image_data["lighting_black_1_sprite_batch"] = compress_module("asset/game_scene/VFX/hit_VFX/special/lighting_black_1.dds")
image_data["lighting_white_0_sprite_batch"] = compress_module("asset/game_scene/VFX/hit_VFX/special/lighting_white_0.dds")
image_data["lighting_white_1_sprite_batch"] = compress_module("asset/game_scene/VFX/hit_VFX/special/lighting_white_1.dds")
image_data["radial_black_sprite_batch"] = compress_module("asset/game_scene/VFX/hit_VFX/special/radial_black.dds")
image_data["radial_white_sprite_batch"] = compress_module("asset/game_scene/VFX/hit_VFX/special/radial_white.dds")

-- HUD_VFX
image_data["HUD_punish"] = non_compress_module("asset/game_scene/VFX/HUD_VFX/PUINISH_HUD_VFX.png")
    -- counter
image_data["HUD_counter_ver0_2"] = compress_module("asset/game_scene/VFX/HUD_VFX/counter_VFX/HUD_counter_ver0_2.dds")
image_data["HUD_counter_ver3"] = compress_module("asset/game_scene/VFX/HUD_VFX/counter_VFX/HUD_counter_ver3.dds")
    -- positive_bouns
image_data["HUD_positive_bouns_LP"] = compress_module("asset/game_scene/VFX/HUD_VFX/positive_bonus_VFX/HUD_positive_bouns_LP.dds")
image_data["HUD_positive_bouns_RP"] = compress_module("asset/game_scene/VFX/HUD_VFX/positive_bonus_VFX/HUD_positive_bouns_RP.dds")

-- stage_VFX
    -- shockwave
image_data["shockwave"] = compress_module("asset/game_scene/VFX/stage_VFX/shockwave.dds")
    -- smoke
image_data["smoke_dash_burst"] = compress_module("asset/game_scene/VFX/stage_VFX/smoke/dash_burst.dds")
image_data["smoke_horizontal_shot"] = compress_module("asset/game_scene/VFX/stage_VFX/smoke/horizontal_shot.dds")
image_data["smoke_land_blow"] = compress_module("asset/game_scene/VFX/stage_VFX/smoke/land_blow.dds")
image_data["smoke_vertical_shot"] = compress_module("asset/game_scene/VFX/stage_VFX/smoke/vertical_shot.dds")
    -- spark
image_data["spark_dcc_burst"] = compress_module("asset/game_scene/VFX/stage_VFX/spark/dcc_burst.dds")
    -- wallbreak
image_data["wallbreak"] = compress_module("asset/game_scene/VFX/stage_VFX/wallbreak.dds")

love.thread.getChannel( 'image_8' ):push( image_data )