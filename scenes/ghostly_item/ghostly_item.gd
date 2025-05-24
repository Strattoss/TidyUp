extends StaticBody3D

@export var item_id: String
var item_name: String
@onready var ghostly_mesh_generator = $GhostlyItemMesh

var items_database: ItemsDatabase
var item_mesh: Mesh

func _ready():
	items_database = get_tree().get_root().get_node("Main").get_node("ItemsDatabase")
	var mesh_path = items_database.get_item_path(item_id)
	item_mesh = load(mesh_path)
	ghostly_mesh_generator.set_up_mesh()
	
	item_name = items_database.get_item_name(item_id)
