require("advance_require_functions")
require("draw_general_use_functions")
require_all_in_folder("update_general_use_functions")
require_all_in_folder("scenes_logic/load_scene")
require_all_init_load_function()

DEBUG_DATA_TABLE = {
	4,5,1.05,
	-10,2.5,1.05,
}

-- DEBUG_DATA_TABLE[1],DEBUG_DATA_TABLE[2],DEBUG_DATA_TABLE[3],
-- DEBUG_DATA_TABLE[4],DEBUG_DATA_TABLE[5],DEBUG_DATA_TABLE[6],

function love.run()
	if love.load then love.load(love.arg.parseGameArguments(arg),arg) end

	-- We don't want the first frame's dt to include time taken by love.load.
	if love.timer then love.timer.step() end

	local UPDATE_RATE = 60
	local DRAW_RATE = 120

	local dt = 0
	local LFRST = 1/UPDATE_RATE  --logic frame rate stabilization timer
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
		DEBUG_LAST_SLEEP = math.max(0,(1/DRAW_RATE-GFRST))
		if love.timer then love.timer.sleep(DEBUG_LAST_SLEEP) end
	end
end

function love.load()
	DEBUG_GAP_NUM = 0
	DEBUG_LAST_SLEEP = 0
	DEBUG_PAUSE = false
	DEBUG_PAUSE_STATE = "Released"
	DEBUG_JUMPING_BREAKPOINT_STATE = "Stop"
	DEBUG_HITBOX_SHOWS = false
	DEBUG_HITBOX_SHOWS_STATE = "Released"
	DEBUG_INFO_SHOWS = false
	DEBUG_INFO_SHOWS_STATE = "Released"

	DEBUG_TRAINNING_TOGGLE = false
	DEBUG_TRAINNING_TOGGLE_STATE = "Released"
	DEBUG_TRAINNING_COUNTER = false
	DEBUG_TRAINNING_COUNTER_STATE = "Released"
	DEBUG_TRAINNING_HEIGHT = 5
	DEBUG_TRAINNING_HEIGHT_STATE = "Released"
	DEBUG_TRAINNING_BLOCK = 0
	DEBUG_TRAINNING_BLOCK_STATE = "Released"
	DEBUG_TRAINNING_WALLSTICK_SOFT_RECOVER_POS = 5
	DEBUG_TRAINNING_WALLSTICK_SOFT_RECOVER_POS_STATE = "Released"
	DEBUG_TRAINNING_THROW_CLASH = false
	DEBUG_TRAINNING_THROW_CLASH_STATE = "Released"
	DEBUG_TRAINNING_SPAWN_POS = 1
	DEBUG_TRAINNING_SPAWN_SIDE = 0
	DEBUG_TRAINNING_SPAWN_ARRAY = {}
	DEBUG_TRAINNING_SPAWN_ARRAY[0] = {}
	DEBUG_TRAINNING_SPAWN_ARRAY[1] = {}
	DEBUG_TRAINNING_SPAWN_ARRAY[2] = {}
	DEBUG_TRAINNING_SPAWN_ARRAY[0][0] = {-2040,-2040+320,1,-1}
	DEBUG_TRAINNING_SPAWN_ARRAY[0][1] = {-2040+320,-2040,-1,1}
	DEBUG_TRAINNING_SPAWN_ARRAY[1][0] = {-320,320,1,-1}
	DEBUG_TRAINNING_SPAWN_ARRAY[1][1] = {320,-320,-1,1}
	DEBUG_TRAINNING_SPAWN_ARRAY[2][0] = {2040-320,2040,1,-1}
	DEBUG_TRAINNING_SPAWN_ARRAY[2][1] = {2040,2040-320,-1,1}
	DEBUG_TRAINNING_SPAWN_STATE = "Released"

	DEBUG_BOX_COLOR_YELLOW = {1,1,0,0.5}
	DEBUG_BOX_COLOR_BLUE = {0,180/255,1,0.5}
	DEBUG_BOX_COLOR_RED = {1,0,0,0.5}

	DEBUG_CACHE_VALUES = {}

	init_input()

	-- read save data
	read_volume_config()
	read_game_duration()
	get_current_resolution()

	modify_quit_game_reocrd()

	JSON = require("dkjson")

	-- character_select_scene & game_scene
	GAME_MODE = 0 -- 1.训练模式 2.本地多人 3.在线多人
	CHAR_SELECT_LR = {}
	CHAR_SELECT_LR["L"] = 4
	CHAR_SELECT_LR["R"] = 5
	CONTROL_METHOD = {}
	CONTROL_METHOD["L"] = 1
	CONTROL_METHOD["R"] = 1
	-- game_scene
	TRAINING_MODE_CONFIG = {}
	TRAINING_MODE_CONFIG["announcer"] = false
		-- network
	NETWORK_MATCH_SIDE = "L"
	NETWORK_OTHER_SIDE = "R"
	ROLLBACK_INPUT_TABLE = {}
	ROLLBACK_INPUT_STATE_TABLE = {}
	ROLLBACK_GAME_CACHE_TABLE = {}
		-- draw & HUD
	CHARACTER_VISUAL_FRONT = "L"
	WIN_MARK = {}
	WIN_MARK["L"] = 0
	WIN_MARK["R"] = 0
	MATCH_POINT = {}
	MATCH_POINT["L"] = 0
	MATCH_POINT["R"] = 0
	ROUND_COUNTER = 1
	ROUND_TIMER = {9,9,6,0} -- 99s and 60f

	-- to be continue

	-- non-character global variable
-------------------------------------------------
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

	-- disclaimer_and_logos_scene
	DISCLAIMER_AND_LOGOS_POSITION = {
		{175,125},
		{620,255},
		{620,255},
	}

	-- start_scene
	OPTION_ID = 0
	SUB_SCENE_CONIFG_MAIN_DABO_TRIG_ID = 0
	AUDIO_BAR_MARK_ID = 0
	CONSOLE_TEXT_1_ID = 0
	CONSOLE_TEXT_2_ID = 0

	OPTION_TEXT_X_POSITION_TABLE = {704,704,729,725,684}
	CONSOLE_TYPE_IN_MARK_X_POSITION_TABLE = {1065,795,815,505,565,930,1115,1110}
	DABO_TIRG_RECORD_SUB_SCENE_Y_POSITION = 500
	DABO_TIRG_CONFIG_SUB_SCENE_Y_POSITION_TABLE = {390,415,440,495}
	BAR_MARK_CONFIG_SUB_SCENE_AUDIO_X_POSITION = 1296
	BAR_MARK_CONFIG_SUB_SCENE_AUDIO_Y_POSITION_TABLE = {400,425}
	BAR_MARK_CONFIG_SUB_SCENE_RESOLUTION_X_POSITION = 1000
	BAR_MARK_CONFIG_SUB_SCENE_RESOLUTION_Y_POSITION = 530

	-- char_select_scene
	LEFT_CHAR_SELECT_CHAR_POSITION = {
		{-400,-5,0},
		{-400,-5,0},
		{-400,-5,0},
		{-400,-5,0},
		{-400,-5,0},
		{-400,-5,0},
		{-400,-5,0},
		{-400,-5,0}
	}
	LEFT_CHAR_SELECT_TEXT_POSITION = {
		{20,-40,0},
		{20,-40,0},
		{20,-40,0},
		{20,-40,0},
		{20,-40,0},
		{20,-40,0},
		{20,-40,0},
		{20,-40,0}
	}
	RIGHT_CHAR_SELECT_CHAR_POSITION = {
		{380,-5,0},
		{380,-5,0},
		{380,-5,0},
		{380,-5,0},
		{380,-5,0},
		{380,-5,0},
		{380,-5,0},
		{380,-5,0}
	}
	RIGHT_CHAR_SELECT_TEXT_POSITION = {
		{915,-35,0},
		{915,-35,0},
		{915,-35,0},
		{915,-35,0},
		{915,-35,0},
		{915,-35,0},
		{915,-35,0},
		{915,-35,0}
	}
	ICON_COVER_POSITION = {
		{0,570},
		{192,570},
		{405,512},
		{603,349},
		{765,168},
		{921,120},
		{1116,122},
		{1327,121},
	}

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
	-- globalCount = countGlobals()
	set_pause()
	set_jump_breakpoint()
	set_show_hitbox()
	set_show_info()
	set_toggle()
	set_counter()
	set_height()
	set_block()
	set_recovery()
	set_throw_clash()
	set_spawn_pos()
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