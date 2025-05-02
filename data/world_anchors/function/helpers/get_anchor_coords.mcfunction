# === Get and store coords ===

$execute store result storage world_anchors:teleport x int 1 run data get storage world_anchors:log_list entries[{name:'$(name)'}].x
$execute store result storage world_anchors:teleport y int 1 run data get storage world_anchors:log_list entries[{name:'$(name)'}].y
$execute store result storage world_anchors:teleport z int 1 run data get storage world_anchors:log_list entries[{name:'$(name)'}].z
