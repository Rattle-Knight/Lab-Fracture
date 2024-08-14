extends Node2D

@export var connected_scene: String
var scene_folder = "res://scenes/actual levels/"


func _on_scene_change_body_entered(body):
	print("yay")
	var full_path = scene_folder + connected_scene + ".tscn"
	var scene_tree = get_tree()
	$sceneChange/yay.play()
	await $sceneChange/yay.finished
	Global.player_is_ready = false
	Global.safe_area_count = 1
	scene_tree.change_scene_to_file(full_path)
