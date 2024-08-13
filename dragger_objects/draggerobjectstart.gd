extends CharacterBody2D


func _process(delta):
	if Global.openapp == true:
		visible = true
	else:
		visible = false
