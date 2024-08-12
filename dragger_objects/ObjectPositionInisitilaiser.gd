extends Node

var downmode = false

var labs : Array
var pieces : Array
var tabletpieces = []

var update_pos = false
@onready var parent = get_parent()

func _process(delta):
	if update_pos and not downmode:
		#updates and moves down
		
		#fill
		tabletpieces.clear()
		labs = get_tree().get_nodes_in_group("labs")
		pieces = get_tree().get_nodes_in_group("pieces")
		for child in pieces:
			tabletpieces.append(child)

		
		#updating
		var tween = create_tween()
		tween.tween_property(parent,"position",Vector2(0,500),0.5)
		update_pos = false
		warp()
		downmode = true
		
	elif update_pos and downmode:
		#moves it back up
		var tween = create_tween()
		tween.tween_property(parent,"position",Vector2(0,0),0.5)
		downmode = false
		update_pos = false
		
		

func warp():
	if labs:
		for indx in range(len(labs)):
			var tween = create_tween()
			tween.tween_property(labs[indx], "position", tabletpieces[indx].position, 1).set_ease(Tween.EASE_IN_OUT).set_trans(Tween.TRANS_ELASTIC)
			tween = create_tween()
			tween.tween_property(labs[indx], "rotation", tabletpieces[indx].rotation, 0.5).set_ease(Tween.EASE_IN_OUT).set_trans(Tween.TRANS_ELASTIC)
			await tween.finished

func _on_button_pressed():
	update_pos = true
	$"../click".play()


func openapp():
	var tween = create_tween()
	tween.tween_property($"../Menuopen","position",Vector2(587,324),0.5)
	tween.tween_property($"../Menuopen","scale",Vector2(0.65,0.65),0.5)
	await tween.finished
	Global.openapp = true
	
func _on_tikto_pressed():
	openapp()
