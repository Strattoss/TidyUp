extends RayCast3D

@export var Prompt : RichTextLabel
var curr_dialogue : String

func _physics_process(delta: float) -> void:

	if is_colliding():
		var collider = get_collider()
		if collider.get_parent().get_parent().has_node("Interactable"):
			var interactable = collider.get_parent().get_parent().get_node("Interactable")
			if interactable.prompt_action == "interact":
				# Prompt Logic
				if Prompt.text == interactable.get_prompt()+ " ["+interactable.get_key()+"]":
					pass
				else:
					Prompt.text = interactable.get_prompt()+ " ["+interactable.get_key()+"]"
				# Key Pressed Logic
				if interactable._hasDialogue:
					curr_dialogue = interactable.dialouge
					if Input.is_action_just_pressed(interactable.prompt_action):
						interactable.run_dialogue()

				elif Input.is_action_just_pressed(interactable.prompt_action):
					interactable.interact(owner)
				


			else:
				Prompt.text = interactable.get_prompt()
	else:
		Prompt.text = ""
