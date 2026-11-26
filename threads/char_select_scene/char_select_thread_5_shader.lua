-- char_select 的 shader 源码(load_char_select_scene_shader 见 scenes/char_select_scene/init.lua)
-- 只读文本,主线程拿到后收进 FILE_TEXT_CACHE,编译时用 common_read_text 取
require "love.filesystem"
local thread_common = require "threads.thread_common"
local thread_text = {}
thread_common.read_text_list({
    "shaders/char_select_fractal_noise.glsl",
    "shaders/radial_blur.glsl"
},thread_text)
love.thread.getChannel('thread_data_5'):push({["__text"] = thread_text})
