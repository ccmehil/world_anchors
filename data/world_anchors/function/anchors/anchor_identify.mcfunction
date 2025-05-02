#=== paper rename ===
execute run item modify entity @s weapon.offhand {"function":"minecraft:set_name","entity":"this","name":{"selector":"@n[type=minecraft:armor_stand, tag=teleport_anchor]"},"target":"custom_name"}

# === Give Player Advancement for identifying an anchor ===
advancement grant @s only world_anchors:world_anchors/identify

#=== Partcile and sound effects ===
playsound minecraft:item.book.page_turn player @s ~ ~ ~ 0.8 1.0
particle warped_spore ~ ~1 ~ 0 0 0 1 50 force @s