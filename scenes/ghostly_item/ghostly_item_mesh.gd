extends MeshInstance3D

var ghostly_material = load("res://materials/ghost_transparent.tres")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	set_up_mesh()

func set_up_mesh() -> void:
	assert(get_parent().item_mesh)
	set_item_mesh(get_parent().item_mesh)
	material_override = ghostly_material


func set_item_mesh(mesh_to_set):
	mesh = mesh_to_set
