extends Area2D

@onready var player = get_tree().get_first_node_in_group("player") 
var safe_area_count = 0

signal player_died

func _ready():
	connect("body_entered", _on_body_entered)
	connect("body_exited", _on_body_exited)

func _process(delta):
	print("count" , Global.safe_area_count)

func _on_body_entered(body):
	if body == player:
		Global.safe_area_count += 1

func _on_body_exited(body):
	if body == player:
		Global.safe_area_count -= 1
		if Global.safe_area_count == 0:
			emit_signal("player_died")
			player.queue_free()  # Kill the player
