execute as @a[advancements={world_anchors:world_anchors/lore=true}] run say you have!

# === Remove items ===
execute as @a run item replace entity @p weapon.offhand with minecraft:air
execute as @a run item replace entity @p weapon.mainhand with minecraft:air

# === Give easter egg ===
execute as @a[advancements={world_anchors:world_anchors/lore=false}] run give @s player_head[profile={name:MHF_Enderman},custom_name=[{"text":"The Old Ones","italic":false}],lore=[[{"text":"The ones who enchanted redstone","italic":false}]],item_name=[{"text":"OldOnes","italic":false}],enchantments={vanishing_curse:1}]
execute as @a[advancements={world_anchors:world_anchors/lore=false}] run give @s golden_apple[equippable={slot:mainhand}] 1

# === Give Player Advancement for lore ===
advancement grant @s only world_anchors:world_anchors/lore
