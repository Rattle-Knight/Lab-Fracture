extends CharacterBody2D

var speed = 100
var player_state

@onready var walking_audio = $AudioStreamPlayer2D

func _ready():
	$dead.visible = false

func _physics_process(delta):
	var direction = Input.get_vector("left", "right", "up", "down")
	
	if direction.x == 0 and direction.y == 0:
		player_state = "idle"
	elif direction.x != 0 or direction.y != 0:
		player_state = "walking"
	
	velocity = direction * speed
	move_and_slide()
	
<<<<<<< HEAD
		play_anim(direction)
	else:
		$AnimatedSprite2D.visible = false
		$dead.visible = true
=======
	play_anim(direction)
>>>>>>> parent of 1a963d2 (aded more death)

func play_anim(dir):
	if not Global.playerdead:
		if player_state == "idle":
			$AnimatedSprite2D.play("idle")
			walking_audio.stop()
		if player_state == "walking":
			$AnimatedSprite2D.stop()
			if !walking_audio.playing:
				walking_audio.play()
		
		#if dir.y == -1:
			#$AnimatedSprite2D.play("walk up")
		#if dir.x == 1:
			#$AnimatedSprite2D.play("walk right")
		#if dir.y == 1:
			#$AnimatedSprite2D.play("walk left")
		#if dir.x == -1:
			#$AnimatedSprite2d.play("walk down")

