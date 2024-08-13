extends Control

func _on_start_pressed():
	get_tree().change_scene_to_file("res://scenes/actual levels/level_1.tscn")
	var can_esc = false


func _on_settings_pressed():
	PauseMenu.toggle_settings()


func _on_exit_pressed():
	get_tree().quit()
