extends Control

signal quest_menu_closed
var quest1_active = false
var quest1_completed = false
var stick = 0


func _process(delta: float) -> void:
	if quest1_active:
		if stick == 3:
			print("quest 1 complete")
			quest1_active = false
			quest1_completed = true
			
	
func quest1_chat():
	$quest1_ui.vsible = true
	
func next_quest():
	if !quest1_completed:
		quest1_chat()
	else:
		$no_quest.visible = true
		await get_tree().create_timer(3).timeout
		$no_quest.visible = false
	
func _on_yes_button_1_pressed() -> void:
	$quest1_ui.visible = true
	quest1_active = true
	stick = 0
	emit_signal("quest_menu_closed")

func _on_no_button_1_pressed() -> void:
	$quest1_ui.visible = false
	quest1_active = false
	emit_signal("quest_menu_closed")
