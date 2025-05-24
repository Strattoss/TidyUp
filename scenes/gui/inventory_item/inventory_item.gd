extends VBoxContainer

func set_item(item_name: String, item_icon: Texture):
	$Label.text = item_name
	$TextureRect.texture = item_icon
