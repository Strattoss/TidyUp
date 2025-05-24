class_name ItemsDatabase extends Node

var item_database: Array = []

func _ready():
	load_item_data()

func load_item_data():
	var file = FileAccess.open("res://assets/items_data.json", FileAccess.READ)
	if file:
		var json_text = file.get_as_text()
		var result = JSON.parse_string(json_text)
		print("----------------------------------")
		print("ITEMS DATABASE")
		print(result)
		item_database = result
		print("Loaded ", item_database.size(), " items.")
		print("----------------------------------")
	else:
		push_error("res://assets/items_data.json")

func get_item(id: String) -> Dictionary:
	for item in item_database:
		if item.get("id", "") == id:
			return item
	return {}  # or null if you prefer

func get_item_name(id: String) -> String:
	var item = get_item(id)
	return item.get("name", "")

func get_item_path(id: String) -> String:
	var item = get_item(id)
	# fallback to `path` if `obj_path` is not used
	return item.get("obj_path", item.get("path", ""))

func get_all_item_ids() -> Array:
	var ids: Array = []
	for item in item_database:
		ids.append(item.get("id", ""))
	return ids

func get_all_item_names() -> Array:
	var names: Array = []
	for item in item_database:
		names.append(item.get("name", ""))
	return names
	

# Drogi Gracjanie z przyszłości, zacząłeś tworzenie "bazy danych" itemów. Zmień concrete object i ghost object, żeby korzystały z tych id, a nie bezpośrednio z .obj.
# Wtedy będzie można zaimplementować podstawianie obiektów pod werjse duszkowe
