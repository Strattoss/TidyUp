extends StaticBody3D

@export var item_id: String
@onready var interactable = $Interactable
@onready var concrete_mesh_generator = $ConcreteItemMesh

var items_database: ItemsDatabase
var item_mesh: Mesh

func _ready():
	items_database = get_tree().get_root().get_node("Main").get_node("ItemsDatabase")
	var mesh_path = items_database.get_item_path(item_id)
	item_mesh = load(mesh_path)
	concrete_mesh_generator.set_up_mesh()

#func interact(player):
	#print("Concrete item interact fired")
	#if interactable:
		#interactable.interact(player)  # Call the interaction logic
