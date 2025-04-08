extends Node

var stored_objects: Array[Node3D] = []

func store_item(item: Node3D):
	item.reparent(get_parent())
	stored_objects.append(item)
	item.position = Vector3.ZERO
