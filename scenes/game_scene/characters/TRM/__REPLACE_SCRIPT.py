# -- LP -> RP
# -- ASSET_DATA[7] -> ASSET_DATA[9]
# -- "L" -> "R"
# -- obj_char_game_scene_char_LP = {0,0,0,1,1,1,0,0} -> obj_char_game_scene_char_RP = {0,0,0,1,-1,1,0,0}
# -- obj_char_game_scene_char_LP["x"] = -320 -> obj_char_game_scene_char_RP["x"] = 320
import re

def replace_content(line: str) -> str:
    line = line.replace('LP','RP')
    line = line.replace('ASSET_DATA[7]','ASSET_DATA[9]')
    line = line.replace('ASSET_DATA[6]','ASSET_DATA[8]')
    line = line.replace('"L"','"R"')
    line = line.replace('obj_char_game_scene_char_RP = {0,0,0,1,1,1,0,0}','obj_char_game_scene_char_RP = {0,0,0,1,-1,1,0,0}')
    line = line.replace('obj_char_game_scene_char_RP["x"] = -320','obj_char_game_scene_char_RP["x"] = 320')
    line = line.replace('local opponent_side_obj_char = obj_char_game_scene_char_RP','local opponent_side_obj_char = obj_char_game_scene_char_LP')
    return line


def process_file(input_file: str,output_file: str):
    with open(input_file,"r",encoding="utf-8") as f:
        lines = f.readlines()

    new_lines = [replace_content(line) for line in lines]

    with open(output_file,"w",encoding="utf-8") as f:
        f.writelines(new_lines)


if __name__ == "__main__":
    process_file("left.lua","right.lua")
