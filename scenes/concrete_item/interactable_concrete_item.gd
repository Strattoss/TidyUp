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
	print("Interacted with ", get_parent().name)
