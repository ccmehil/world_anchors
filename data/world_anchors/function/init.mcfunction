# === Timing objectives (for fade and removal effects) ===
scoreboard objectives add anchor_age dummy
scoreboard objectives add anchor_count dummy
scoreboard objectives add anchor_cooldown dummy

# === Avoid multiple placement messages and multiple anchors with same name ===
scoreboard objectives add placed_anchor dummy
scoreboard objectives add existing_anchor dummy
scoreboard objectives add found_anchor dummy

# === Debug Mode ===
scoreboard objectives add debug_active dummy "Debug Mode"

tellraw @a [{"text":"[SERVER]", "color":"aqua"}, {"text":" World Anchors Storage Initialized","color":"green"}]
