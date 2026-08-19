local filesys_module = require "love.filesystem"
local image_module = require "love.image"
local auido_module = require "love.sound"
local compress_module = image_module.newCompressedData
local non_compress_module = image_module.newImageData
local sound_module = auido_module.newSoundData
local thread_data = {}
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
-- special_VFX
thread_data["special_lighting_0_sprite_batch"] = compress_module("asset/game_scene/common/texture/VFX/hit_VFX/_special/lighting_0.dds")
thread_data["special_lighting_1_sprite_batch"] = compress_module("asset/game_scene/common/texture/VFX/hit_VFX/_special/lighting_1.dds")
thread_data["special_radial_sprite_batch"] = compress_module("asset/game_scene/common/texture/VFX/hit_VFX/_special/radial.dds")
love.thread.getChannel( 'thread_data_6' ):push( thread_data )
