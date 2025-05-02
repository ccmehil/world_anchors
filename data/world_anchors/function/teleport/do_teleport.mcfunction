#=== Effects ==
function world_anchors:teleport/teleport_effects

#=== Teleport Player ===
$tp @a[distance=..0.5] $(x) $(y) $(z)

#=== Effects After Teleport ===
$execute positioned $(x) $(y) $(z) run function world_anchors:teleport/teleport_effects

# === Give Player Advancement for first teleport ===
advancement grant @s only world_anchors:world_anchors/traveler

# === Optional cleanup ===
data remove storage world_anchors:teleport *