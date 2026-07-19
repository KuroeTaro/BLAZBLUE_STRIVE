local filesys_module = require "love.filesystem"
local image_module = require "love.image"
local auido_module = require "love.sound"
local compress_module = image_module.newCompressedData
local non_compress_module = image_module.newImageData
local sound_module = auido_module.newSoundData
local thread_data = {}
thread_data[1] = compress_module("asset/game_scene/stage/alpha/texture/stage_obj/wallbreak_after_debris.dds")
thread_data[2] = compress_module("asset/game_scene/stage/alpha/texture/stage_obj/wallbreak_dynamic.dds")
thread_data[3] = compress_module("asset/game_scene/stage/alpha/texture/stage_obj/wallbreak_glow.dds")
thread_data[4] = compress_module("asset/game_scene/stage/alpha/texture/stage_obj/wallbreak_smoke.dds")
thread_data[5] = compress_module("asset/game_scene/stage/alpha/texture/stage_obj/wallstick_ver0.dds")
thread_data[6] = compress_module("asset/game_scene/stage/alpha/texture/stage_obj/wallstick_ver1.dds")
thread_data[7] = compress_module("asset/game_scene/stage/alpha/texture/stage_obj/ground.dds")
thread_data[8] = compress_module("asset/game_scene/stage/alpha/texture/stage_obj/stage_liner_fade.dds")
thread_data[9] = compress_module("asset/game_scene/stage/alpha/texture/stage_obj/stair.dds")
thread_data[10] = compress_module("asset/game_scene/stage/alpha/texture/stage_obj/tile_map.dds")
-- stage_VFX
    -- shockwave
thread_data["air_dash_shockwave"] = compress_module("asset/game_scene/stage/alpha/texture/stage_VFX/air_dash_shockwave.dds")
    -- smoke
thread_data["dash_shot"] = compress_module("asset/game_scene/stage/alpha/texture/stage_VFX/dash_shot.dds")
thread_data["horizontal_shot"] = compress_module("asset/game_scene/stage/alpha/texture/stage_VFX/horizontal_shot.dds")
thread_data["land_blow"] = compress_module("asset/game_scene/stage/alpha/texture/stage_VFX/land_blow.dds")
thread_data["vertical_shot"] = compress_module("asset/game_scene/stage/alpha/texture/stage_VFX/vertical_shot.dds")
    -- spark
thread_data["dcc_blow"] = compress_module("asset/game_scene/stage/alpha/texture/stage_VFX/dcc_blow.dds")
love.thread.getChannel( 'thread_data_4' ):push( thread_data )
