# === Display message ===
tellraw @a [{"text":"[SERVER]", "color":"aqua"}, {"text":" World Anchors Loaded","color":"green"}]

# === Activate debug for all devs ===
scoreboard players set @a[tag=debug] debug_active 1

# === Prime Temp holder ===
data modify storage world_anchors:temp version set value "1.00"

# === Run init setup (objectives, storage, etc.) ===
function world_anchors:init
