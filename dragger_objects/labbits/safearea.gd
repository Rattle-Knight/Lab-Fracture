extends Area2D

@onready var player = get_tree().get_first_node_in_group("player") 
var safe_area_count = 0


signal player_died
signal entered
signal exit

func _ready():
	connect("body_entered", _on_body_entered)
	connect("body_exited", _on_body_exited)

func _on_body_entered(body):
	if body == player:
		Global.safe_area_count += 1
		emit_signal("entered")

func _on_body_exited(body):
	if body == player:
		Global.safe_area_count -= 1
		if Global.safe_area_count == 0:
			var deathsfx = $"../../../player/splat"
			var deathuhoh = $"../../../player/uhoh"
			emit_signal("player_died")
			Global.playerdead = true
			deathuhoh.play()
			deathsfx.play()
			await deathuhoh.finished
			player.queue_free()  # Kill the player
			
			
		emit_signal("exit")
