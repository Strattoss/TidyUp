extends MeshInstance3D

var ghostly_material = load("res://materials/ghost_transparent.tres")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	set_up_mesh()

func set_up_mesh() -> void:
	# set up chosen mesh
	assert(get_parent().item_mesh)
	set_item_mesh(get_parent().item_mesh)
	
	# set the ghostly material for the object
	material_override = ghostly_material
	
	# create collider 
	# TODO: the collidershould not collide with the player, just with the RayCast3D from the Player
	create_multiple_convex_collisions()

func set_item_mesh(mesh_to_set):
	mesh = mesh_to_set
