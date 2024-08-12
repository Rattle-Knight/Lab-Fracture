extends CharacterBody2D

var dragable = false
var is_dragging = false

@onready var area = $area


var delay  = 10
var dragging: bool = false
var drag_offset: Vector2 = Vector2.ZERO

var vel: Vector2 = Vector2.ZERO

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				if dragable:
					dragging = true
					drag_offset = self.global_position - event.global_position
			else:
				dragging = false
	elif event is InputEventMouseMotion and dragging:
		var target_position = event.global_position + drag_offset
		velocity = (target_position - global_position) / get_physics_process_delta_time()

func _physics_process(delta):
	if dragging:
		move_and_slide()
	else:
		velocity = Vector2.ZERO



func _on_area_2d_mouse_entered():
	dragable = true
	area.material.set_shader_parameter("color",Color(0,1,1,1))


func _on_area_2d_mouse_exited():
	dragable = false
	area.material.set_shader_parameter("color",Color(0,0,0,0))
