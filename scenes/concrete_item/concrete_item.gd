extends StaticBody3D

@export var item_mesh: Mesh
@export var item_name: String
@onready var interactable = $Interactable


#func interact(player):
	#print("Concrete item interact fired")
	#if interactable:
		#interactable.interact(player)  # Call the interaction logic
