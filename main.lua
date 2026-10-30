-- setup force hot compilation
require("jit.opt").start("hotloop=42","hotexit=7")
-- include required modules
require("advance_require_functions")
require("draw_general_use_functions")
require_all_in_folder("update_general_use_functions")
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
			love.graphics.present()
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
			print(update_time,draw_time)
		end
		DEBUG_LAST_SLEEP = math.max(0,(1/DRAW_RATE - GFRST))
		if love.timer then love.timer.sleep(DEBUG_LAST_SLEEP) end
	end
end
function love.load()
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
	NEXT_UPDATE_BLOCK = update_disclaimer_and_logos_scene_main
	NEXT_DRAW_BLOCK = draw_disclaimer_and_logos_scene_main
	NEXT_PRESET = preset_disclaimer_and_logos_scene
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
	-- gc
	set_nuGC(0.001,10,true)
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