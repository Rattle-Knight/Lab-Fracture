extends Node

var triggercount = 0

@export var connected_scene: String
var scene_folder = "res://scenes/actual levels/"
@onready var player = get_tree().get_first_node_in_group("player") 


func switcher():
	Global.safe_area_count = 10
	triggercount += 1
	var labs = get_tree().get_nodes_in_group("labs")
	var pieces = get_tree().get_nodes_in_group("pieces")
	
	$"../../../uhoh".play()
	for indx in range(len(labs)):
		$"../sceneChange/whoosh".play_with_random_pitch()
		var tween = create_tween()
		tween.tween_property(labs[indx], "position", labs[indx].position + Vector2(0,-100), 1).set_ease(Tween.EASE_IN_OUT).set_trans(Tween.TRANS_ELASTIC)
		pieces[indx].position = labs[indx].position
		if indx == 1 or indx == 3:
			pieces[indx].trueimmobile = false
		
		tween = create_tween()
		tween.tween_property(labs[indx], "rotation", labs[indx].rotation + 45, 0.5).set_ease(Tween.EASE_IN_OUT).set_trans(Tween.TRANS_ELASTIC)
		pieces[indx].rotation = labs[indx].rotation
		await tween.finished


	var tweenend = create_tween()
	var startpos = $"../../start".position
	tweenend.tween_property($"../../start", "position", $"../../../player".position , 1).set_ease(Tween.EASE_IN_OUT)
	tweenend = create_tween()
	tweenend.tween_property($"..", "position", $"..".position + Vector2(0,-100) , 1).set_ease(Tween.EASE_IN_OUT).set_trans(Tween.TRANS_ELASTIC)
	await tweenend.finished
	tweenend = create_tween()
	tweenend.tween_property($"..", "position", startpos , 1).set_ease(Tween.EASE_IN_OUT).set_trans(Tween.TRANS_ELASTIC)
	Global.safe_area_count = 1
	
	#switch positions of icons
	var temppos = $"../../../tablet/end".position 
	$"../../../tablet/end".position = $"../../../tablet/start".position 
	$"../../../tablet/start".position = temppos
	tweenend = create_tween()
	tweenend.tween_property($"../../../tablet", "rotation_degrees", 7 , 1).set_ease(Tween.EASE_IN_OUT).set_trans(Tween.TRANS_ELASTIC)



func _on_scene_change_body_entered(body):
	if body == player:
		if triggercount == 0:
			switcher()
		else:
			$"../sceneChange/yay".play()
			await $"../sceneChange/yay".finished
			var full_path = scene_folder + connected_scene + ".tscn"
			var scene_tree = get_tree()
			scene_tree.change_scene_to_file(full_path)
		
