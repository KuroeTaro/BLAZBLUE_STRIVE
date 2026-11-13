local image_module = require "love.image"
local compress_module = image_module.newCompressedData
local thread_data = {}
-- burst_VFX
thread_data["burst_back_sprite_batch"] = compress_module("asset/game_scene/common/texture/VFX/burst_VFX/burst_back.dds")
thread_data["burst_front_sprite_batch"] =
compress_module("asset/game_scene/common/texture/VFX/burst_VFX/burst_front.dds")
-- overdrive_VFX
thread_data["overdrive_airflow_sprite_batch"] =
compress_module("asset/game_scene/common/texture/VFX/overdrive_airflow.dds")
-- RC_VFX
thread_data["RC_blast_sprite_batch"] = compress_module("asset/game_scene/common/texture/VFX/RC_blast.dds")
thread_data["RC_partical_sprite_batch"] = compress_module("asset/game_scene/common/texture/VFX/RC_partical.dds")
thread_data["RC_blue_badge_sprite_batch"] = compress_module("asset/game_scene/common/texture/VFX/RC_blue_badge.dds")
thread_data["RC_purple_badge_sprite_batch"] = compress_module("asset/game_scene/common/texture/VFX/RC_purple_badge.dds")
thread_data["RC_red_badge_sprite_batch"] = compress_module("asset/game_scene/common/texture/VFX/RC_red_badge.dds")
thread_data["RC_yellow_badge_sprite_batch"] = compress_module("asset/game_scene/common/texture/VFX/RC_yellow_badge.dds")
-- UA_VFX
thread_data["UA_back_sprite_batch"] = compress_module("asset/game_scene/common/texture/VFX/UA_back.dds")
thread_data["UA_front_sprite_batch"] = compress_module("asset/game_scene/common/texture/VFX/UA_front.dds")
love.thread.getChannel('thread_data_8'):push(thread_data)