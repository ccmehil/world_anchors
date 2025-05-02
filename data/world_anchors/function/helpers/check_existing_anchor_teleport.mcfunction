# === Display message ===
execute if score @s debug_active matches 1 run tellraw @s [{"text":"[World Anchors]", "color":"aqua"}, {"text":" Searching","color":"green"}]
execute if score @s debug_active matches 1 run tellraw @s [{"text":"Check Existing ", "color":"aqua"}, {"score":{"name":"@s","objective":"found_anchor","color":"green"}}]

$execute if data storage world_anchors:log_list entries[{name:'$(name)'}] if score @s debug_active matches 1 run tellraw @s [{"text":"Anchor Exists", "color":"green"}]
$execute if data storage world_anchors:log_list entries[{name:'$(name)'}] run scoreboard players set @s found_anchor 1

execute if score @s debug_active matches 1 run tellraw @s [{"text":"Check Existing ", "color":"aqua"}, {"score":{"name":"@s","objective":"found_anchor","color":"green"}}]

