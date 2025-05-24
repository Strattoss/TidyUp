extends Node

@export var prompt_text: String = "Put down"
@export var prompt_key: String = "E"
@export var prompt_action: String = "interact"
var _hasDialogue = false
var _isInteractable = true

var _placement_service: PlacementService

func _ready() -> void:
	_placement_service = get_tree().get_root().get_node("Main").get_node("PlacementSpot").get_node("PlacementService")

func get_prompt():
	return prompt_text

func get_key():
	return prompt_key

func interact(player):
	assert(_isInteractable)

	if not _placement_service.take_item(get_parent().item_id):
		print(get_parent().item_name, " not placed. Incorrect ghostly silhouette")
		return
		
	print("Placed ", get_parent().item_name, " on the right place")
	_isInteractable = false
	prompt_action = ""
	get_parent().ghostly_mesh_generator.set_ghostly_material_override(false)
