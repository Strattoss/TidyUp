extends Node

@export var prompt_text: String = "Pick up"
@export var prompt_key: String = "E"
@export var prompt_action: String = "interact"
var _hasDialogue = false

func get_prompt():
	return prompt_text

func get_key():
	return prompt_key

func interact(player):
	print("Move object ", get_parent().name, " to the placement spot")
	var placement_spot = get_tree().get_root().get_node("Main").get_node("PlacementSpot")
	placement_spot.get_node("PlacementService").store_item(get_parent())
	
