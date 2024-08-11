extends Node


var tabletpieces = []

var update_pos = false

func _process(delta):
	if update_pos:
		print("filling")
		tabletpieces.clear()
		var labs = get_tree().get_nodes_in_group("labs")
		var pieces = get_tree().get_nodes_in_group("pieces")
		for child in pieces:
			tabletpieces.append(child)
			#eh
			child.visible = false
		
		for indx in range(len(labs)):
			labs[indx].position = tabletpieces[indx].position
		
		print("updating")
		update_pos = false

func _on_button_pressed():
	update_pos = true
