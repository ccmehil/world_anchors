#========= Show particles at all active anchors =========#
execute if dimension minecraft:overworld run function world_anchors:anchors/anchor_particles

#========= Handle anchor placement =========#
execute as @a at @s if dimension minecraft:overworld if block ~ ~ ~ minecraft:redstone_wire if block ~ ~-1 ~ #minecraft:redstone_ores run function world_anchors:anchors/anchor_create

#========= Handle anchor identify =========#
execute as @a at @s if predicate world_anchors:check_redstone_ore if items entity @s weapon.offhand minecraft:paper[minecraft:count=1, !minecraft:custom_name] if entity @n[type=minecraft:armor_stand, tag=teleport_anchor, distance=..1] run function world_anchors:anchors/anchor_identify
 
#========= Handle teleport =========# 
execute as @a at @s if predicate world_anchors:check_teleport if entity @n[type=minecraft:armor_stand, tag=teleport_anchor, distance=..1] unless items entity @s weapon.offhand minecraft:writable_book[minecraft:count=1, !minecraft:custom_name] run function world_anchors:teleport/teleport_player

#========= Handle easter egg =========# 
execute as @a at @s if predicate world_anchors:check_lore if entity @n[type=minecraft:armor_stand, tag=teleport_anchor, distance=..1] run function world_anchors:helpers/give_lore_item

#========= Cooldown tracking =========#
scoreboard players add @a anchor_cooldown 0
scoreboard players remove @a[scores={anchor_cooldown=1..}] anchor_cooldown 1

#========= Anchor aging =========#
scoreboard players add @e[tag=teleport_anchor] anchor_age 1

#========= Anchor validation (destroy if block is gone) =========#
execute if dimension minecraft:overworld run function world_anchors:anchors/anchor_validate