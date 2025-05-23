class_name PlacementService extends Node

# TODO: change to a set for better performance
var stored_objects: Array[String] = []
var items_database: ItemsDatabase

func _ready() -> void:
	items_database = get_tree().get_root().get_node("Main").get_node("ItemsDatabase")

func store_item(item: String):
	stored_objects.append(item)

func take_item(item: String) -> bool:
	if not item in stored_objects:
		return false
	stored_objects.erase(item)
	return true
