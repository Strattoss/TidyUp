extends MeshInstance3D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	set_up_mesh()

func set_up_mesh():
	assert(get_parent().item_mesh)
	set_item_mesh(get_parent().item_mesh)
	create_multiple_convex_collisions()

func set_item_mesh(mesh_to_set):
	mesh = mesh_to_set
