extends MeshInstance3D

var ghostly_material = load("res://materials/ghost_transparent.tres")


func set_up_mesh() -> void:
	# set up chosen mesh
	assert(get_parent().item_mesh)
	mesh = get_parent().item_mesh
	
	# set the ghostly material for the object
	set_ghostly_material_override(true)
	
	# create collider 
	# TODO: the collider should not collide with the player, just with the RayCast3D from the Player
	create_multiple_convex_collisions()

func set_ghostly_material_override(true_or_false: bool):
	if true_or_false:
		material_override = ghostly_material
	else:
		material_override = null
