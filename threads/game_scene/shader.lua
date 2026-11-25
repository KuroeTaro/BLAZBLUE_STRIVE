-- game_scene 公共 shader 的源码(load_game_scene_common_shader 见 scenes/game_scene/_common/init.lua)
-- 只读文本,主线程拿到后收进 FILE_TEXT_CACHE,编译时用 common_read_text 取
require "love.filesystem"
local thread_common = require "threads.thread_common"
local thread_text = {}
thread_common.read_text_list({
    "shaders/game_fractal_noise.glsl",
    "shaders/radial_blur.glsl",
    "shaders/shadow_radial_blur.glsl",
    "shaders/brightness_contrast.glsl",
    "shaders/counter_partical_3d.glsl",
    "shaders/overdrive_badge_partical_3d.glsl",
    "shaders/overdrive_badge_particle.glsl",
    "shaders/burst_shockwave_projectile_3d.glsl",
    "shaders/fd_block_3d.glsl"
},thread_text)
love.thread.getChannel('thread_data_11'):push({["__text"] = thread_text})
