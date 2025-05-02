tellraw @s [{"text":"[DEBUG]", "color":"aqua"},{"text": " Anchor Placement", "color": "green"}]

# === Store Player Position (Anchor Position) === 
execute store result storage world_anchors:temp x int 1 run data get entity @s Pos[0] 1
execute store result storage world_anchors:temp y int 1 run data get entity @s Pos[1] 1
execute store result storage world_anchors:temp z int 1 run data get entity @s Pos[2] 1

# === Store Player UUID ===
data modify storage world_anchors:temp uuid set from entity @s UUID

# === Store anchor if blocks at feet is correct ===
data modify storage world_anchors:temp name set from entity @s equipment.offhand.components."minecraft:custom_name"
execute as @a if score @s placed_anchor matches 0 run scoreboard players set @s placed_anchor 1
execute unless data storage world_anchors:temp name run data modify storage world_anchors:temp name set value "What Anchor"
execute if block ~ ~-1 ~ #minecraft:redstone_ores if block ~ ~ ~ minecraft:redstone_wire run setblock ~ ~ ~ minecraft:air
execute run scoreboard players set @s placed_anchor 1
execute run scoreboard players set @s existing_anchor 1

# === Summon Marker Armor Stand ===
execute as @a if score @s debug_active matches 1 run tellraw @s [{"text":"[DEBUG]", "color": "aqua"},{"text":" Summoning marker armor stand", "color": "green"}]
summon armor_stand ~ ~ ~ {Tags:["teleport_anchor","new_anchor"],Invisible:1b,Marker:1b,Glowing:1b,NoGravity:1b,CustomName:'{"text":"Anchor"}'}
data modify entity @e[tag=new_anchor,limit=1,sort=nearest] CustomName set from storage world_anchors:temp name

# === Store Armor Stand UUID ===
data modify storage world_anchors:temp anchor_uuid set from entity @e[tag=new_anchor,limit=1,sort=nearest] UUID

# === Generate Banner for Anchor ===
function world_anchors:helpers/give_anchor_banner with storage world_anchors:temp

# === Cleanup Tag so it's not reused ===
tag @e[tag=new_anchor,limit=1,sort=nearest] remove new_anchor

# === Debug: Show the anchor about to be added ===
execute as @a if score @s debug_active matches 1 run tellraw @s [{"text":"[DEBUG]", "color": "aqua"},{"text":" Temp Anchor Data", "color": "green"}]
execute as @a if score @s debug_active matches 1 run data get storage world_anchors:temp

# === Append only if name exists ===
execute if data storage world_anchors:temp name run data modify storage world_anchors:log_list entries append from storage world_anchors:temp

# === Optional cleanup ===
data remove storage world_anchors:temp *

# === Give Player Advancement for setting anchor ===
advancement grant @s only world_anchors:world_anchors/get_together

# === Feedback to the Player ===
title @s title {"text":"World Anchor Set","color":"aqua"}
playsound minecraft:block.enchantment_table.use player @s ~ ~ ~ 0.8 1.0
particle minecraft:enchant ~ ~1 ~ 0.3 0.5 0.3 0.01 20 force

execute as @a if score @s debug_active matches 1 run tellraw @s [{"text":"[DEBUG]", "color":"aqua"},{"text": " Placed Anchor: ", "color": "green"},{"score":{"name":"@s","objective":"placed_anchor"}}]
