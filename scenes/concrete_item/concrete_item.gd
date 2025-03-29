extends StaticBody3D

@export var item_mesh: Mesh
@onready var interactable = $Interactable

func a():
	position = position.clamp(Vector3.ZERO, Vector3.ONE)

func interact(player):
	print("Concrete item interact fired")
	if interactable:
		interactable.interact(player)  # Call the interaction logic
