extends Control

@export var connected_scene = ""
var scene_folder = "res://scenes/actual levels/"


func _process(_delta):
	if Global.playerdead:
		visible = true



func _on_retry_button_pressed():
	var full_path = scene_folder + connected_scene + ".tscn"
	var scene_tree = get_tree()
	Global.playerdead = false
	Global.openapp = true
	scene_tree.change_scene_to_file(full_path)

