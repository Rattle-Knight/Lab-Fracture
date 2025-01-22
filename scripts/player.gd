extends CharacterBody2D

var speed = 100
var player_state

@onready var walking_audio = $AudioStreamPlayer2D
@onready var anim = $AnimationPlayer






func _ready():
	$dead.visible = false

func _physics_process(delta):

	if not Global.playerdead and Global.downmode:
		var direction = Input.get_vector("left", "right", "up", "down")
	
		if direction.x == 0 and direction.y == 0:
			player_state = "idle"
		elif direction.x > 0 or direction.y != 0:
			player_state = "walkingright"
		elif direction.x < 0 or direction.y != 0:
			player_state = "walkingleft"

	
	velocity = direction * speed
	move_and_slide()
	

		play_anim(direction)

	elif Global.playerdead:
		$Sprite2D.visible = false
		$HolloyDead.visible = true
		
func play_anim(dir):
	if player_state == "idle":
		anim.play("RESET")
		walking_audio.stop()
	if player_state == "walkingright":
		anim.play("walkr")
		if !walking_audio.playing:
			walking_audio.play()
			
	if player_state == "walkingleft":
		anim.play("walkL")
		if !walking_audio.playing:
			walking_audio.play()


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




