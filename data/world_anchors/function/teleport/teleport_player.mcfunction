#=== Get name on paper, and check it exists ===
data modify storage world_anchors:teleport name set from entity @s equipment.offhand.components."minecraft:custom_name"
function world_anchors:helpers/check_existing_anchor_teleport with storage world_anchors:teleport
function world_anchors:helpers/get_anchor_coords with storage world_anchors:teleport

execute if score @s debug_active matches 1 run tellraw @s [{"text":"Anchor found ", "color":"aqua"}, {"score":{"name":"@s","objective":"found_anchor","color":"green"}}]

#=== Get coords for teleport ===
execute if score @s found_anchor matches 1 run function world_anchors:teleport/do_teleport with storage world_anchors:teleport 
