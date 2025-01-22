extends Area2D

@onready var player = get_tree().get_first_node_in_group("player") 
var safe_area_count = 0

signal player_died
signal entered
signal exit

func _ready():
	connect("body_entered", _on_body_entered)
	connect("body_exited", _on_body_exited)
	call_deferred("_on_scene_loaded")
	
func _on_scene_loaded():
	Global.safe_area_count = 0
	Global.player_is_ready = true



func _on_body_entered(body):
	if body == player and Global.player_is_ready:
		Global.safe_area_count += 1
		emit_signal("entered")


func _on_body_exited(body):
	if body == player and Global.player_is_ready:
		Global.safe_area_count -= 1
		if Global.safe_area_count == 0:

			var deathsfx = $"../../../splat"
			var deathuhoh = $"../../../uhoh"

			emit_signal("player_died")
			player.queue_free()  # Kill the player
		emit_signal("exit")
