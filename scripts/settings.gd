extends Control

func toggle_settings():
	if self.visible == false:
		self.visible = true
	elif self.visible == true:
		self.visible = false


func _on_volume_value_changed(value):
	AudioServer.set_bus_volume_db(0, value)

func _on_h_slider_value_changed(value):
	AudioServer.set_bus_volume_db(1, value)

func _on_option_button_item_selected(index):
	match index:
		0:
			DisplayServer.window_set_size(Vector2i(1920, 1080))
		1:
			DisplayServer.window_set_size(Vector2i(1600, 900))
		2:
			DisplayServer.window_set_size(Vector2i(1280, 720))


