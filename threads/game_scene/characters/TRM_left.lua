local filesys_module = require "love.filesystem"
local image_module = require "love.image"
local auido_module = require "love.sound"
local compress_module = image_module.newCompressedData
local non_compress_module = image_module.newImageData
local sound_module = auido_module.newSoundData
local thread_data = {}

-- 通用类
local load_universal_name_table = {
    "0_air_Launcher_teched",
    "0_air_Launcher_teching",
    "0_crouch_hurt",
    "0_general_hurt_falled_knockout",
    "0_general_hurt_hard_knockdown_down",
    "0_general_hurt_hard_knockdown_head_down",
    "0_general_hurt_hard_knockdown_up",
    "0_general_hurt_hard_knockdown_wallstick_ground",
    "0_general_hurt_hard_recovery_down",
    "0_general_hurt_hard_recovery_up",
    "0_general_hurt_hard_recovery_wallstick_ground",
    "0_general_hurt_launched_float",
    "0_general_hurt_launched_groundbounce",
    "0_general_hurt_launched_high",
    "0_general_hurt_launched_low",
    "0_general_hurt_launched_mid_hori_heavy",
    "0_general_hurt_launched_mid_up",
    "0_general_hurt_launched_rolling",
    "0_general_hurt_launched_rotate",
    "0_general_hurt_launched_wallbounce",
    "0_general_hurt_semi_launched_mid",
    "0_general_hurt_semi_launched_rotate",
    "0_general_hurt_soft_knockdown_wallstick_air",
    "0_general_hurt_soft_recovery_ground",
    "0_general_hurt_soft_recovery_wallstick_air",
    "0_ground_Launcher_teched",
    "0_ground_Launcher_teching",
    "0_stand_hurt_high",
    "0_stand_hurt_low",
    "0_stand_hurt_mid",
    "1_2_3_crouch",
    "1_2_3_crouch_to_stand_idle",
    "1_2_3_crouch_turn",
    "1_4_7_air_block",
    "1_4_7_air_block_guard_crash",
    "1_crouch_block",
    "1_crouch_block_guard_crash",
    "4_stand_block_guard_crash",
    "4_stand_block_high",
    "4_stand_block_mid",
    "4_walk",
    "4_walk_to_stand_idle",
    "4dash_air_backdash",
    "4dash_backdash",
    "5_stand_idle",
    "5_stand_dash_skid",
    "5_stand_turn",
    "6_walk",
    "6_walk_to_stand_idle",
    "6dash_air_dash",
    "6dash_dash",
    "7_8_9[Launcher]_follow_jump",
    "7_8_9_jump_air_to_stand_idle",
    "7_8_9_pre_jump",
    "7_jump",
    "8_jump",
    "9_jump"
}
for i,v in ipairs(load_universal_name_table) do
    thread_data[v] = compress_module("asset/game_scene/characters/TRM/_character/UNIVERSAL/TRM_"..v..".dds")
end 

-- 攻击类
local load_attack_name_table = {
    "burst_overdrive_rc_ground",--burst会生成一个伤害为0的攻击判定
    "2P",
    "6P",
    "5P",
    "2K",
    "6K",
    "5K",
    "2S",
    "6S",
    "cS",
    "fS",
    "5H",
    "5H_oroboros_ease_in_mid",
    "5H_oroboros_ease_out_mid",
    "5H_oroboros_loop_back",
    "5H_oroboros_loop_front",
    "5H_oroboros_loop_mid",
    "5H_oroboros_shot",
    "5H_reticle_ease_out",
    "5H_reticle_locked",
    "5H_reticle_locking",
    "5H_reticle_shot",
    "5H_reticle_unlocked",
    "5H_reticle_unlocking",
    "2Launcher",
    "4_6Launcher",
    "4_6Launcher_success",
    "5Launcher",
    "jP",
    "jK",
    "j2K",
    "jS",
    "j5Launcher",
    "j4_6Launcher",
    "j4_6Launcher_success"
}
for i,v in ipairs(load_attack_name_table) do
    thread_data[v] = compress_module("asset/game_scene/characters/TRM/_character/ATTACK/TRM_"..v..".dds")
end

-- 角色whiff_VFX类
local load_whiff_VFX_name_table = {
    "2P",
    "6P",
    "5P",
    -- "2K",
    -- "6K",
    -- "5K",
    "2S",
    "6S",
    "cS",
    -- "fS",
    "5H_shot_oroboros_blast",
    "5H_switch",
    -- "2Launcher"
    -- "4_6Launcher",
    -- "4_6Launcher_success",
    "5Launcher",
    "5Launcher_glow",
    -- "jP",
    -- "jK",
    "jS"
}
for i,v in ipairs(load_whiff_VFX_name_table) do
    thread_data[v.."_whiff_VFX"] = compress_module("asset/game_scene/VFX/whiff_VFX/TRM/".."TRM_"..v..".dds")
end

-- projectile
local load_projectile_name_table = {
    "5H",
    "5H_miss"
}
for i,v in ipairs(load_projectile_name_table) do
    thread_data[v.."_projectile"] = compress_module("asset/game_scene/characters/TRM/_character/PROJECTILE/".."TRM_"..v..".dds")
end

-- special
thread_data["overdrive_badge"] = compress_module("asset/game_scene/VFX/overdrive_badge/TRM_overdrive_badge.dds")

love.thread.getChannel( 'thread_data_2' ):push( thread_data )