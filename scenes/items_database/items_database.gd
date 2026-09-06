class_name ItemsDatabase extends Node

const DATA_PATH := "res://assets/items_data.json"

# fields that required and cannot be empty
const REQUIRED_FIELDS := { 
	"id": TYPE_STRING,
	"name": TYPE_STRING,
	"obj_path": TYPE_STRING,
	"icon_path": TYPE_STRING
}

# Items database. Items accessible by id
var items_by_id: Dictionary = {}

func _ready():
	load_item_data()

func load_item_data() -> bool:
	items_by_id.clear()
	
	var json_data = read_data_file(DATA_PATH)
	if json_data == null:
		return false

	var errors: Array[String] = []
	for index in json_data.size():
		var item = json_data[index]
		if not item is Dictionary:
			errors.append("Item at index %d is not a Dictionary." % index)
			continue
		
		var validation_error := validate_item(item, index)
		
		if validation_error != "":
			errors.append(validation_error)
			continue
		
		var item_id: String = item["id"]
		if items_by_id.has(item_id):
			errors.append("Duplicate item id '%s' at index %d." % [item_id, index])
			continue
			
		items_by_id[item_id] = item
	
	if not errors.is_empty():
		for error in errors:
			push_error("ItemsDatabase: %s" % error)
		push_error("ItemsDatabase: Failed to load item database. " + "%d error(s) found." % errors.size())
		items_by_id.clear()
		return false
	
	print("----------------------------------")
	print("ITEMS DATABASE")
	print("Loaded %d items." % items_by_id.size())
	print("----------------------------------")
	
	return true

func read_data_file(path: String):
	if not FileAccess.file_exists(DATA_PATH): 
		push_error("ItemsDatabase: File does not exist: %s" % DATA_PATH)
		return null
	var file := FileAccess.open(DATA_PATH, FileAccess.READ)
	
	if file == null:
		push_error("ItemsDatabase: Could not open file: %s" % DATA_PATH)
		return null
	
	var json_text := file.get_as_text()
	var json_data = JSON.parse_string(json_text)
	
	if json_data == null:
		push_error("ItemsDatabase: Invalid JSON in file: %s" % DATA_PATH)
		return null
	
	if not json_data is Array:
		push_error("ItemsDatabase: Root element must be an Array.")
		return null
	
	return json_data

func validate_item(item: Dictionary, index: int) -> String:
	for field in REQUIRED_FIELDS:
		if not item.has(field):
			return ("Item at index %d is missing required field '%s'." % [index, field])
		if item[field].is_empty():
			return "Item at index %d has an empty field '%s'." % [index, field]
		
		var expected_type: int = REQUIRED_FIELDS[field]
		var actual_type: int = typeof(item[field])
		if actual_type != expected_type:
			return ("Item at index %d has invalid type for '%s'. " + "Expected %s, got %s." % [ index, field, type_string(expected_type), type_string(actual_type) ])
	
	return ""
	
func get_item(id: String) -> Dictionary:
	if not items_by_id.has(id):
		push_error("ItemsDatabase: No item with id '%s' exists." % id )
		return {}
	return items_by_id[id]

func has_item(id: String) -> bool:
	return items_by_id.has(id)

func get_item_name(id: String) -> String:
	var item := get_item(id)
	return item["name"]

func get_item_path(id: String) -> String:
	var item := get_item(id)
	return item["obj_path"]

func get_all_item_ids() -> Array[String]:
	return items_by_id.keys()

func get_all_item_names() -> Array[String]:
	var names: Array[String] = []
	for item in items_by_id.values():
		names.append(item["name"])
	return names

# Drogi Gracjanie z przyszłości, zacząłeś tworzenie "bazy danych" itemów. Zmień concrete object i ghost object, żeby korzystały z tych id, a nie bezpośrednio z .obj.
# Wtedy będzie można zaimplementować podstawianie obiektów pod werjse duszkowe
