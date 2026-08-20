# -- LP -> RP
# -- ASSET_DATA[9] -> ASSET_DATA[11]
# -- "L" -> "R"
# -- obj_char_game_scene_char_LP = {0,0,0,1,1,1,0,0} -> obj_char_game_scene_char_RP = {0,0,0,1,-1,1,0,0}
# -- obj_char_game_scene_char_LP["x"] = -320 -> obj_char_game_scene_char_RP["x"] = 320
# -- 对手引用：left 里 obj_char_game_scene_char_RP 一律代表对手，需换回 LP。
# --   例）local opponent_side_obj_char = obj_char_game_scene_char_RP   -> ..._LP
# --       common_game_scene_get_character_facing_currect(obj_char_game_scene_char_LP,obj_char_game_scene_char_RP)
# --           -> common_game_scene_get_character_facing_currect(obj_char_game_scene_char_RP,obj_char_game_scene_char_LP)
import re

def replace_content(line: str) -> str:
    # 1) 先把对手引用换成占位符（left 里 obj_char_game_scene_char_RP 只代表对手），
    #    否则下面的 LP->RP 会把己方引用也变成 RP，之后就无法区分了。
    line = line.replace('obj_char_game_scene_char_RP','obj_char_game_scene_char_OPPONENT')
    # 2) 己方 LP -> RP（函数名、对象名、变量名里的 LP 一并替换）
    line = line.replace('LP','RP')
    # 3) 对手占位符换回 LP（right 的对手是 LP）
    line = line.replace('obj_char_game_scene_char_OPPONENT','obj_char_game_scene_char_LP')
    # 4) 其余映射
    line = line.replace('ASSET_DATA[9]','ASSET_DATA[11]')
    line = line.replace('ASSET_DATA[8]','ASSET_DATA[10]')
    line = line.replace('"L"','"R"')
    # 4b) 对称 input：left 里 local opponent_side_input = ...["R"]，
    #     生成 right 后对手是 LP，需把输入状态换回 ["L"]（必须放在 "L"->"R" 之后）
    line = line.replace('local opponent_side_input = INPUT_SYS_CURRENT_COMMAND_STATE["R"]',
                        'local opponent_side_input = INPUT_SYS_CURRENT_COMMAND_STATE["L"]')
    # 5) 己方定义行的 obj[5] / x 翻转（此时己方已是 obj_char_game_scene_char_RP）
    line = line.replace('obj_char_game_scene_char_RP = {0,0,0,1,1,1,0,0}','obj_char_game_scene_char_RP = {0,0,0,1,-1,1,0,0}')
    line = line.replace('obj_char_game_scene_char_RP["x"] = -320','obj_char_game_scene_char_RP["x"] = 320')
    return line


def process_file(input_file: str,output_file: str):
    with open(input_file,"r",encoding="utf-8") as f:
        lines = f.readlines()

    new_lines = [replace_content(line) for line in lines]

    with open(output_file,"w",encoding="utf-8") as f:
        f.writelines(new_lines)


if __name__ == "__main__":
    process_file("left.lua","right.lua")
