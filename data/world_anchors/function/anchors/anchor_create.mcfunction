execute if score @s debug_active matches 1 run tellraw @s [{"text":"[DEBUG]", "color": "aqua"},{"text":" Anchor Creation", "color": "green"}]

#=== Set flag to prevent re-running while standing on anchor ===
scoreboard players set @s placed_anchor 0
scoreboard players set @s existing_anchor 0

# === Validate Dimension and Block Configuration ===
execute unless items entity @s weapon.offhand paper run tellraw @s [{"text":"[DEBUG] ", "color": "aqua"},{"text":"Paper not in off hand!", "color": "green"}]
execute if items entity @s weapon.offhand *[!minecraft:custom_name] run tellraw @s [{"text":"[DEBUG] ", "color": "aqua"},{"text":"Paper not named", "color": "green"}]

# === Validate Anchor custom name does not already exist ===
data modify storage world_anchors:temp name set from entity @s equipment.offhand.components."minecraft:custom_name"
function world_anchors:helpers/check_existing_anchor with storage world_anchors:temp

execute if score @s debug_active matches 1 run tellraw @s [{"text":"Anchor does not exist ", "color":"aqua"}, {"score":{"name":"@s","objective":"existing_anchor","color":"green"}}]
execute if score @s debug_active matches 1 run tellraw @s [{"text":"Anchor not yet placed ", "color":"aqua"}, {"score":{"name":"@s","objective":"placed_anchor","color":"green"}}]

#=== Place the Anchor if all validations met ===
execute if score @s placed_anchor matches 0 if score @s existing_anchor matches 0 unless items entity @p weapon.offhand paper[!minecraft:custom_name] run function world_anchors:anchors/anchor_placement
