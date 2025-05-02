# === Store coordinates of the anchor being removed ===
execute store result storage world_anchors:temp x int 1 run data get entity @s Pos[0] 1
execute store result storage world_anchors:temp y int 1 run data get entity @s Pos[1] 1
execute store result storage world_anchors:temp z int 1 run data get entity @s Pos[2] 1

# === Update global list to remove entry ===
data modify storage world_anchors:temp removing_uuid set from entity @e[tag=teleport_anchor,limit=1,sort=nearest] UUID
execute as @a if score @s debug_active matches 1 run tellraw @s [{"text":"[DEBUG] ","color":"aqua"},{"text":"Removing removing_uuid: ","color":"gray"},{"nbt":"removing_uuid","storage":"world_anchors:temp"}]
function world_anchors:helpers/remove_from_list_macro with storage world_anchors:temp

# === Remove Armor Stand marked for deletion ===
kill @e[type=armor_stand,tag=teleport_anchor,limit=1,sort=nearest]

# === Feedback Effects ===
particle minecraft:poof ~ ~1 ~ 0.5 0.5 0.5 0.02 20
playsound minecraft:block.fire.extinguish player @a[distance=..10] ~ ~ ~ 0.6 1.0
title @a[distance=..10] title {"text":"World Anchor Removed","color":"red"}

execute as @a if score @s debug_active matches 1 run tellraw @s [{"text":"[DEBUG]", "color":"aqua"}, {"text": "Removed World Anchor", "color":"green"}]
