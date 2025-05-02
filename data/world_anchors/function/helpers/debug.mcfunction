# --- DEBUG START ---
tellraw @a[tag=debug] {"text":"--- DEBUG START ---","color":"gold"}

# === Selected item in hand === 
tellraw @a[tag=debug] {"text":"Selected Item:","color":"aqua"}
execute as @a[tag=debug] run tellraw @s [{"nbt":"SelectedItem","entity":"@s"}]

# === Block below the player === 
tellraw @a[tag=debug] {"text":"Block below player:","color":"aqua"}
execute as @a[tag=debug] positioned ~ ~-1 ~ run execute if block ~ ~ ~ #minecraft:redstone_ores run tellraw @s {"text":"Redstone Ore ✔","color":"green"}
execute as @a[tag=debug] positioned ~ ~-1 ~ run execute unless block ~ ~ ~ #minecraft:redstone_ores run tellraw @s {"text":"Not Redstone Ore ✘","color":"red"}

# === Redstone check === 
tellraw @a[tag=debug] {"text":"Block at feet:","color":"aqua"}
execute as @a[tag=debug] positioned ~ ~ ~ run execute if block ~ ~ ~ minecraft:redstone_wire run tellraw @s {"text":"Redstone Dust ✔","color":"green"}
execute as @a[tag=debug] positioned ~ ~ ~ run execute unless block ~ ~ ~ minecraft:redstone_wire run tellraw @s {"text":"No Redstone Dust ✘","color":"red"}

# === Player position === 
tellraw @a[tag=debug] {"text":"Player Position:","color":"aqua"}
execute as @a[tag=debug] run tellraw @s [{"nbt":"Pos","entity":"@s"}]

# === Global List Values ===
tellraw @a[tag=debug] {"text":"Block Log Entries","color":"aqua"}
tellraw @a[tag=debug] {"text":"***","color":"gray"}

execute store result score #count anchor_count run data get storage world_anchors:log_list entries
execute if data storage world_anchors:log_list entries[0] run tellraw @a[tag=debug] {"text":"Anchor 0 exists","color":"yellow"}
tellraw @a[tag=debug] [{"text":"Total Anchors in List: ","color":"yellow"},{"score":{"name":"#count","objective":"anchor_count"}}]
tellraw @a[tag=debug] {"text":"***","color":"gray"}

# Entry 0 display
execute as @a[tag=debug] if data storage world_anchors:log_list entries[0] run tellraw @s [{"text":"[0] Name: ","color":"gray"},{"nbt":"entries[0].name","storage":"world_anchors:log_list"}]
execute as @a[tag=debug] if data storage world_anchors:log_list entries[0] run tellraw @s [{"text":"[0] Pos: ","color":"gray"},{"nbt":"entries[0].x","storage":"world_anchors:log_list"},{"text":", ","color":"gray"},{"nbt":"entries[0].y","storage":"world_anchors:log_list"},{"text":", ","color":"gray"},{"nbt":"entries[0].z","storage":"world_anchors:log_list"}]
execute as @a[tag=debug] if data storage world_anchors:log_list entries[0] run tellraw @s [{"text":"[0] Deleted: ","color":"gray"},{"nbt":"entries[0].deleted","storage":"world_anchors:log_list"}]

tellraw @a[tag=debug] {"text":"***","color":"gray"}

# --- DEBUG END ---
tellraw @a[tag=debug] {"text":"--- DEBUG END ---","color":"gold"}