extends Node2D
class_name scenechange

@export var connected_scene: String
var scene_folder = "res://scenes/"
@onready var player = get_tree().get_first_node_in_group("player") 

func _on_body_entered(body):
	if body == player:
		var full_path = scene_folder + connected_scene + ".tscn"
		var scene_tree = get_tree()
		$"../../../player/yay".play()
		await $"../../../player/yay".finished
		scene_tree.change_scene_to_file(full_path)
	
