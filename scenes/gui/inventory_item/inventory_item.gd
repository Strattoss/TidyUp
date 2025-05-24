extends ColorRect

func set_item(item_name: String, item_icon: Texture):
	$MarginContainer/HBox/Label.text = item_name
	$MarginContainer/HBox/TextureRect.texture = item_icon
