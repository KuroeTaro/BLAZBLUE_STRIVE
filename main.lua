-- setup force hot compilation
require("jit.opt").start("hotloop=1","hotexit=120")
---- include required modules
require("advance_require_functions")
require("draw_general_use_functions")
require_all_in_folder("update_general_use_functions")
-- 加载计时(调试用,见 update_general_use_functions/thread_load.lua):
-- 之后的 require 超过阈值就打印;单次 draw / rectangle 超过阈值也打印(慢绘制探针)
if DEBUG_ORDER_LOAD_TIMING then
	debug_wrap_require()
	debug_wrap_draw()
end
require_all_in_folder("scenes/load_scene")
require_all_init_load_function()
-- int main()/mandatory entry point
function love.run()
	if love.load then love.load(love.arg.parseGameArguments(arg),arg) end
	-- We don't want the first frame's dt to include time taken by love.load.
	if love.timer then love.timer.step() end
	local UPDATE_RATE = 60
	local DRAW_RATE = 120
	local dt = 0
	local LFRST = 1/UPDATE_RATE --logic frame rate stabilization timer
	local GFRST = 1/DRAW_RATE --graphic frame rate stabilization timer
	-- global_counter = 0
	local loop_time = love.timer.getTime()
	local update_time = love.timer.getTime()
	local draw_time = love.timer.getTime()
	-- Main loop time.
	return function()
		-- Process events.
		if love.event then
			love.event.pump()
			for name,a,b,c,d,e,f in love.event.poll() do
				if name == "quit" then
					if not love.quit or not love.quit() then
						return a or 0
					end
				end
				love.handlers[name](a,b,c,d,e,f)
			end
		end
		-- Update dt,as we'll be passing it to update
		dt = love.timer.step()
		LFRST = LFRST + dt
		GFRST = GFRST + dt
		loop_time = love.timer.getTime()
		-- 每圈清零:没跑 update / draw 的那一圈打印出来就是 0,不会混进上一圈的数
		update_time = 0
		draw_time = 0
		DEBUG_GC_TIME = 0
		local present_time = 0
		-- Call update and draw
		if LFRST >= 1/UPDATE_RATE then
			update_time = love.timer.getTime()
			if love.update then love.update() end -- will pass 0 if love.timer is disabled
			update_time = love.timer.getTime() - update_time
			-- print(update_time)
			LFRST = LFRST%(1/UPDATE_RATE)
		end
		if GFRST >= 1/DRAW_RATE then
			draw_time = love.timer.getTime()
			if love.draw then love.draw() end
			draw_time = love.timer.getTime() - draw_time
			-- if draw_time > 0.016 then
			-- 	print(draw_time)
			-- end
			present_time = love.timer.getTime()
			love.graphics.present()
			present_time = love.timer.getTime() - present_time
			-- local gc_time = love.timer.getTime()
			-- collectgarbage()
			-- gc_time = love.timer.getTime() - gc_time
			-- if gc_time > 0.016 then
			-- 	print(gc_time)
			-- end
			GFRST = GFRST%(1/DRAW_RATE)
		end
		loop_time = love.timer.getTime() - loop_time
		if loop_time > 0.016 then
			-- 加载中(最近 1 个逻辑帧执行过 order_load)把那一步也带上:
			-- 驱动拖到 present 才做的编译 / 上传会算进这一帧的 present
			local last_step = ""
			if DEBUG_UPDATE_COUNT - DEBUG_ORDER_LOAD_LAST_STEP_FRAME <= 1 then
				last_step = " | 最近一步 " .. DEBUG_ORDER_LOAD_LAST_STEP
			end
			print(string.format(
				"[frame] loop %.2fms update %.2fms(gc %.2fms) draw %.2fms present %.2fms%s",
				loop_time*1000,update_time*1000,DEBUG_GC_TIME*1000,draw_time*1000,present_time*1000,last_step
			))
		end
		DEBUG_LAST_SLEEP = math.max(0,(1/DRAW_RATE - GFRST))
		if love.timer then love.timer.sleep(DEBUG_LAST_SLEEP) end
	end
end
function love.load()
	-- 启动时的暖机(见 update_general_use_functions/warm_up.lua)
	init_warm_up()
	-- 所有可调配置都在 scenes/_scene_config 下,启动时一次性全部加载
	require_all_in_folder("scenes/_scene_config")
	init_input()
	-- read save data
	read_volume_config()
	read_game_duration()
	get_current_resolution()
	modify_quit_game_reocrd()
	JSON = require("dkjson")
	-- load_scene
	THREAD_TABLE = {}
	THREAD_AMOUNT = 0
	THREAD_ONCE_TABLE = {}
	ASSET_DATA = {}
	LOAD_FUNCTION_TABLE = {}
	LOAD_ORDER_TABLE = {}
	ORDER_SIZE_TABLE = {}
	LOAD_ONCE_TABLE = {}
	LOADING_FUNCTION_AMOUNT = 0
	LOADING_AUDIO_PLAYED_ONCE = false
	-- 函数名字符串,由 load_scene 从 _G 取(disclaimer 的 prep 也会再设一次)
	NEXT_UPDATE_BLOCK = "update_disclaimer_and_logos_scene_main"
	NEXT_DRAW_BLOCK = "draw_disclaimer_and_logos_scene_main"
	NEXT_PRESET = "preset_disclaimer_and_logos_scene"
	--	general_scene_global_variable
	FRAMES_DRAWN = 0
	SCENE_TIMER = 0
---------------------------------------------------
	current_update_block = update_load_scene_load_pre_timer
	current_draw_block = function() end
end
function love.update()
	-- http://127.0.0.1:8000
	require("lovebird").update()
	-- gc(计时给 love.run 里的帧耗时打印用)
	local gc_time = love.timer.getTime()
	set_nuGC(0.001,10,true)
	DEBUG_GC_TIME = love.timer.getTime() - gc_time
	-- trainning_mode_debug_low_ver
	-- change_later
	set_pause()
	set_show_info()
	set_show_hitbox()
	set_hot_update()
	set_jump_breakpoint()
	set_toggle()
	set_counter()
	set_height()
	set_block()
	set_recovery()
	set_throw_clash()
	set_spawn_pos()
	-- input
	update_input()
	if not DEBUG_PAUSE then
		update_record_game_duration()
		current_update_block()
	end
	FPS = love.timer.getFPS()
	FRAMES_DRAWN = FRAMES_DRAWN + 1
	DEBUG_UPDATE_COUNT = DEBUG_UPDATE_COUNT + 1
end
function love.draw()
	love.graphics.clear(7/255,19/255,31/255,1)
	current_draw_block()
	if DEBUG_INFO_SHOWS then
		love.graphics.setColor(0,0,0,0.5)
		draw_debug_info_all(2,2)
		draw_debug_info_all(0,2)
		draw_debug_info_all(2,0)
		draw_debug_info_all(0,0)
		love.graphics.setColor(1,1,1,1)
		draw_debug_info_all(1,1)
	end
end