DRIVE_SYS 备份说明（会话产出）
================================

分工最终定案：
    角色动画  ->  drive_sys_on_fly_init(start_pos, end_pos)   （引导）
    drive_sys ->  insert_projectile_..._SP_H_chain(...)        （生成飞行道具）
    飞行道具  ->  命中判定 / 伤害 / 受击动画                   （判定）
    drive_sys ->  drive_sys_draw(...)                          （绘制）

状态机：off -> on_fly -> bite_hit(咬中) / bite_miss(没咬中) -> pull_back -> off
    on_fly    : 飞道伸展中（chain_elapsed < chain_extend_frames）
    bite_hit  : 飞道 chain_hitted == true
    bite_miss : 伸展结束仍未命中
    pull_back : 飞道进入收回阶段（chain_retract_from 出现）
    off       : 飞道 chain_length <= 0 / 引用为空

文件：
    ^drive_sys.lua            —— 原 _character_function.lua 末尾的 drive_sys 全部函数
    ^drive_sys_projectile.lua —— 原 _projectile.lua 末尾的链子飞行道具（判定用，draw 为空）
    ^drive_sys_wiring.lua     —— 需要接进 left.lua / right.lua / _anim.lua 的片段
    ^drive_chain_fade.glsl    —— 起始端线性渐变 shader

重新接回时的注意点：
    1. _character_function.lua 追加 ^drive_sys.lua 的内容；
    2. _projectile.lua 追加 ^drive_sys_projectile.lua 的内容；
    3. 按 ^drive_sys_wiring.lua 里的注释把三处片段插回去；
    4. 把 ^drive_chain_fade.glsl 放回 shaders/ 目录（drive_sys_draw 里按路径懒加载）。
    5. 美术资产（TRM_SP_H_chain / TRM_SP_H_oroboros 的 dds+json+加载表）在项目本体里保留未删。
