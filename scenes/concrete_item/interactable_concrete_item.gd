extends Node

@export var prompt_text: String = "Pick up"
@export var prompt_key: String = "E"
@export var prompt_action: String = "interact"
var _hasDialogue = false

var placement_service: PlacementService

func _ready() -> void:
	placement_service = get_tree().get_root().get_node("Main").get_node("PlacementSpot").get_node("PlacementService")

func get_prompt():
	return prompt_text

func get_key():
	return prompt_key

func interact(player):
	print("Picked up ", get_parent().name)
	#var placement_spot = get_tree().get_root().get_node("Main").get_node("PlacementSpot")
	
	#placement_spot.get_node("PlacementService").store_item(get_parent())
	placement_service.store_item(get_parent().item_id)
	
	# hide object or move it so that player cannot interact with it
	#item.reparent(get_parent())
	get_parent().position = Vector3.ZERO
	
