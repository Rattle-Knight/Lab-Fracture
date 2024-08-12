extends CharacterBody2D

var speed = 100

var player_state

func _physics_process(delta):
	var direction = Input.get_vector("left", "right", "up", "down")
	
	if direction.x == 0 and direction.y == 0:
		player_state = "idle"
	elif direction.x != 0 or direction.y != 0:
		player_state = "walking"
	
	velocity = direction * speed
	move_and_slide()
	
	play_anim(direction)

func play_anim(dir):
	if player_state == "idle":
		$AnimatedSprite2D.play("idle")
	if player_state == "walking":
		$AnimatedSprite2D.stop()
		#if dir.y == -1:
			#$AnimatedSprite2D.play("walk up")
		#if dir.x == 1:
			#$AnimatedSprite2D.play("walk right")
		#if dir.y == 1:
			#$AnimatedSprite2D.play("walk left")
		#if dir.x == -1:
			#$AnimatedSprite2d.play("walk down")

