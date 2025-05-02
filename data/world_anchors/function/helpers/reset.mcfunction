# === Remove all anchor marker entities === 
kill @e[tag=teleport_anchor]

# === Broad wipe of all marker types we might use === 
kill @e[type=minecraft:armor_stand,tag=teleport_anchor]

# === Just in case something weird was tagged incorrectly === 
kill @e[type=minecraft:armor_stand,name="Anchor"]

# === Reset player anchor-related scores === 
scoreboard players reset @a anchor_cooldown
scoreboard players reset @e[type=armor_stand] anchor_age

# == Clear global List ===
data modify storage world_anchors:log_list entries set value []

execute as @a if score @s debug_active matches 1 run tellraw @a [{"text":"[SERVER]", "color":"aqua"}, {"text":" World Anchors Reset","color":"green"}]
