class_name PlacementService extends Node

# TODO: change to a set for better performance
var stored_items: Array[String] = [] # contains ids of items
var items_database: ItemsDatabase

func _ready() -> void:
	items_database = get_tree().get_root().get_node("Main").get_node("ItemsDatabase")

func store_item(id: String):
	stored_items.append(id)

func take_item(id: String) -> bool:
	if id not in stored_items:
		return false
	stored_items.erase(id)
	return true
