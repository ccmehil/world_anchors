#**
#DESCRIPTION:
    #Remove the data associated with the uuid
#CALLED FROM:
    #world_anchors:helpers/remove_from_list
#**

#=== Remove the data ===
$data remove storage world_anchors:log_list entries[{anchor_uuid:$(removing_uuid)}]