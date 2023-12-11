extends Node

# popup/print/notificatin global?


var debug_screen 

func _input(event):
	if event is InputEventKey:
		if event.pressed:
			for action in InputMap.get_actions():
				if InputMap.event_is_action(event, action):
					match action:
						"reload_scene":
							get_tree().reload_current_scene()
							#Command.Console()
						"quit_scene":
							get_tree().quit()
						"quote_left":
							if debug_screen:
								debug_screen.changeVisibility()

					
