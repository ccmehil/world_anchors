# === Only run in the Overworld ===
execute as @a if score @s debug_active matches 1 unless dimension minecraft:overworld run tellraw @s [{"text":"[DEBUG]", "color":"aqua"}, {"text": " Structure Validation Skipped (Not Overworld)", "color":"green"}]

# === Remove anchors only if they are no longer valid ===
execute as @e[type=armor_stand,tag=teleport_anchor] at @s unless block ~ ~-1 ~ #minecraft:redstone_ores run function world_anchors:anchors/anchor_remove