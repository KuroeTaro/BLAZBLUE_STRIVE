local image_module = require "love.image"
local compress_module = image_module.newCompressedData
local thread_data = {}
-- projectile_VFX
thread_data["RC_shockwave_sprite_batch"] = compress_module("asset/game_scene/common/texture/VFX/RC_shockwave.dds")
love.thread.getChannel('thread_data_5'):push(thread_data)