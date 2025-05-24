extends Control

@onready var items_container = $Panel/ItemsContainer
var placement_service: PlacementService

func _ready():
	placement_service = get_tree().get_root().get_node("Main/PlacementSpot/PlacementService")
	placement_service.connect("inventory_updated", self._on_inventory_updated)
	_on_inventory_updated()

func _on_inventory_updated():
	for child in items_container.get_children():
		child.queue_free()
	
	for id in placement_service.stored_items:
		var item_data = placement_service.items_database.get_item(id)
		var item_entry = preload("res://scenes/gui/inventory_item/inventory_item.tscn").instantiate()
		item_entry.set_item(item_data.name, "res://scenes/gui/new_mesh_texture.tres") # assuming item_data has name & icon
		items_container.add_child(item_entry)
