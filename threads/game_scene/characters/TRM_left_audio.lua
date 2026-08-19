local filesys_module = require "love.filesystem"
local auido_module = require "love.sound"
local sound_module = auido_module.newSoundData
local thread_data = {}
local base = "asset/game_scene/characters/TRM/audio/"
-- stage_interactive_SFX
thread_data["stage_interactive_SFX"] = {}
local file_name_table = {
    "air_backdash","air_dash","air_jump","air_SP_jump",
    "ground_dash_cancel","ground_dash_loop","ground_dash_skid","ground_dash_start_up",
    "ground_hard_knockdown","ground_land","ground_soft_knockdown",
    "ground_step_0","ground_step_1","wall_wallbreak","wall_wallstick"
}
for i = 1,#file_name_table do
    local key = file_name_table[i]
    thread_data["stage_interactive_SFX"][key] = sound_module(base .. "stage_interactive_SFX/" .. key .. ".ogg")
end
-- move_SFX
thread_data["move_SFX"] = {}
thread_data["move_SFX_keys"] = {}
local move_SFX_folder_table = {
    {folder = "common",files = {"common_oroboros"}},
    {folder = "RC",files = {
            "blue_RC","purple_RC",
            "red_RC_block","red_RC_counter","red_RC_hit","red_RC_whiff",
            "yellow_RC_block","yellow_RC_counter","yellow_RC_hit","yellow_RC_whiff"
        }
    },
    {folder = "normal/2P",files = {"2P_block","2P_counter","2P_hit","2P_whiff"}},
    {folder = "normal/6P",files = {"6P_block","6P_counter","6P_hit","6P_whiff"}},
    {folder = "normal/5P",files = {"5P_block","5P_counter","5P_hit","5P_whiff"}},
    {folder = "normal/2K",files = {"2K_block","2K_counter","2K_hit","2K_whiff"}},
    {folder = "normal/6K",files = {"6K_block","6K_counter","6K_hit","6K_whiff"}},
    {folder = "normal/5K",files = {"5K_block","5K_counter","5K_hit","5K_whiff"}},
    {folder = "normal/2S",files = {"2S_block","2S_counter","2S_hit","2S_whiff"}},
    {folder = "normal/6S",files = {"6S_block","6S_counter","6S_hit","6S_whiff"}},
    {folder = "normal/cS",files = {"cS_block","cS_counter","cS_hit","cS_whiff"}},
    {folder = "normal/fS",files = {"fS_block","fS_counter","fS_hit","fS_whiff"}},
    {folder = "normal/5H",files = {
            "5H_knife_clip_0","5H_knife_clip_1","5H_knife_clip_2","5H_knife_whiff",
            "5H_oroboros_blast","5H_projectile_block","5H_projectile_counter","5H_projectile_hit","5H_projectile_whiff",
            "5H_reticle_ease_in","5H_reticle_ease_out","5H_reticle_locking"
        }
    },
    {folder = "normal/2Launcher",files = {"2Launcher_block","2Launcher_counter","2Launcher_hit","2Launcher_whiff"}},
    {folder = "normal/4_6Launcher",files = {"4_6Launcher_hit","4_6Launcher_throw","4_6Launcher_whiff"}},
    {folder = "normal/5Launcher",files = {"5Launcher_block","5Launcher_counter","5Launcher_hit","5Launcher_whiff"}},
    {folder = "normal/j5P",files = {"j5P_block","j5P_counter","j5P_hit","j5P_whiff"}},
    {folder = "normal/j2K",files = {"j2K_block","j2K_counter","j2K_hit","j2K_whiff"}},
    {folder = "normal/j5K",files = {"j5K_block","j5K_counter","j5K_hit","j5K_whiff"}},
    {folder = "normal/j5S",files = {"j5S_block","j5S_counter","j5S_hit","j5S_whiff"}},
    {folder = "normal/j4_6Launcher",files = {"j4_6Launcher_hit","j4_6Launcher_throw","j4_6Launcher_whiff"}},
    {folder = "normal/j5Launcher",files = {"j5Launcher_block","j5Launcher_counter","j5Launcher_hit","j5Launcher_whiff"}},
    {folder = "special/4SP_P",files = {"4SP_P_clip_0","4SP_P_clip_1","4SP_P_clip_2","4SP_P_knife_whiff"}},
    {folder = "special/6SP_P",files = {"6SP_P_curse_ball_ground_bounce","6SP_P_curse_ball_hit","6SP_P_curse_end","6SP_P_whiff"}},
    {folder = "special/4SP_K",files = {"4SP_K_whiff"}},
    {folder = "special/6SP_K",files = {"6SP_K_scapegoat_ease_in","6SP_K_scapegoat_ease_out"}},
    {folder = "special/6SP_S",files = {"6SP_S_block","6SP_S_counter","6SP_S_hit","6SP_S_whiff"}},
    -- overdrive
    {folder = "overdrive",files = {"overdrive"}}
}
for i = 1,#move_SFX_folder_table do
    local folder = move_SFX_folder_table[i].folder
    local file_name_table = move_SFX_folder_table[i].files
    for j = 1,#file_name_table do
        local key = file_name_table[j]
        thread_data["move_SFX"][key] = sound_module(base .. "move_SFX/" .. folder .. "/" .. key .. ".ogg")
        thread_data["move_SFX_keys"][#thread_data["move_SFX_keys"]+1] = key
    end
end
love.thread.getChannel( 'thread_data_8' ):push( thread_data )