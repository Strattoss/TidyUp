extends StaticBody3D

@export
var item_mesh: Mesh
var ghostly_material = load("res://materials/ghost_transparent.tres")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	set_up_mesh()

func set_up_mesh() -> void:
	assert(item_mesh)
	set_item_mesh(item_mesh)
	$ItemMesh.material_override = ghostly_material


func set_item_mesh(mesh):
	$ItemMesh.mesh = mesh
