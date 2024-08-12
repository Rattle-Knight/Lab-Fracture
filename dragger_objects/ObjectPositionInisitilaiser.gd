extends Node

var labs : Array
var pieces : Array
var tabletpieces = []

var update_pos = false
@onready var parent = get_parent()

func _process(delta):
	if update_pos:
		print("filling")
		tabletpieces.clear()
		labs = get_tree().get_nodes_in_group("labs")
		pieces = get_tree().get_nodes_in_group("pieces")
		for child in pieces:
			tabletpieces.append(child)

		print("updating")
		var tween = create_tween()
		tween.tween_property(parent,"position",Vector2(0,500),0.5)
		update_pos = false
		warp()
		
		

func warp():
	if labs:
		for indx in range(len(labs)):
			var tween = create_tween()
			tween.tween_property(labs[indx], "position", tabletpieces[indx].position, 0.5).set_ease(Tween.EASE_IN_OUT).set_trans(Tween.TRANS_ELASTIC)
			await tween.finished

func _on_button_pressed():
	update_pos = true



