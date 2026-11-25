require "love.filesystem"
local thread_text = {}
local thread_data = {}
local thread_common = require "threads.thread_common"
local image_module = require "love.image"
local compress_module = thread_common.with_sibling_json(thread_common.new_compressed_data,thread_text)
-- projectile_VFX
thread_data["RC_shockwave_sprite_batch"] = compress_module("asset/game_scene/common/texture/VFX/RC_shockwave.dds")
thread_data["__text"] = thread_text
love.thread.getChannel('thread_data_6'):push(thread_data)