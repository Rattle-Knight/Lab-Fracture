extends CharacterBody2D

var dragable = false
var is_dragging = false
var rotating = false

@onready var area = $area

var rotational = self.rotation_degrees
var delay  = 10
var dragging: bool = false
var drag_offset: Vector2 = Vector2.ZERO

var vel: Vector2 = Vector2.ZERO

@export var trueimmobile = false
var immobile = false

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			#DRAG
			if event.pressed:
				if dragable and not immobile and not trueimmobile:
					dragging = true
					drag_offset = self.global_position - event.global_position
			else:
				dragging = false

		if event.button_index == MOUSE_BUTTON_RIGHT:
			#ROTATION
			if event.pressed and not rotating and dragable and not immobile and not trueimmobile:
				var tween = create_tween()
				tween.tween_property(self,"rotation_degrees",rotational,0.5)
				rotating = true
				rotational += 90
				if tween.finished:
					rotating = false


	elif event is InputEventMouseMotion and dragging and not immobile and not trueimmobile:
		var target_position = event.global_position + drag_offset
		velocity = (target_position - global_position) / get_physics_process_delta_time()

func _physics_process(delta):
	if dragging:
		move_and_slide()
	else:
		velocity = Vector2.ZERO

func _process(delta):
	if Global.openapp == true:
		visible = true
	else:
		visible = false

func _on_area_2d_mouse_entered():
	dragable = true
	if immobile or trueimmobile:
		area.material.set_shader_parameter("color",Color(0.6,0,0,1))
	else:
		area.material.set_shader_parameter("color",Color(0,1,1,1))


func _on_area_2d_mouse_exited():
	dragable = false
	area.material.set_shader_parameter("color",Color(0,0,0,0))


func _on_safearea_entered():
	immobile = true



func _on_safearea_exit():
	immobile = false
