extends StaticBody3D

@export
var item_mesh: Mesh

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	set_up_mesh()

func set_up_mesh():
	assert(item_mesh)
	set_item_mesh(item_mesh)
	$ItemMesh.create_multiple_convex_collisions()

func set_item_mesh(mesh):
	$ItemMesh.mesh = mesh
