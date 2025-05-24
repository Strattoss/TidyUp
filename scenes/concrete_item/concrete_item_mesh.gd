extends MeshInstance3D

func set_up_mesh():
	assert(get_parent().item_mesh)
	set_item_mesh(get_parent().item_mesh)
	create_multiple_convex_collisions()

func set_item_mesh(mesh_to_set):
	mesh = mesh_to_set
