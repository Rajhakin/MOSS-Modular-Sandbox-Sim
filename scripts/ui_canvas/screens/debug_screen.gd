extends Control

# connect to debug singleton, self as argument, so we know where to call stuff
# animate text? append a letter at a time, scroll sfx on each line /r
# puppetmaster user name before line 

@onready var text_edit = $CommandConsole/PanelContainer/MarginContainer/VBoxContainer/TextEdit
@onready var line_edit = $CommandConsole/PanelContainer/MarginContainer/VBoxContainer/LineEdit


func _ready():
	Debug.debug_screen = self
	line_edit.text_submitted.connect(on_text_submitted)
	line_edit.text_changed.connect(on_text_changed)


func _input(event):
	if line_edit.has_focus():
		if event is InputEventKey and event.pressed:
			if event.is_echo() == false:
				if event.is_action_pressed("ui_accept"):
					AudioManager.play(PreLoader.HACKING_ENTER_KEY_PRESSED)
				else:
					AudioManager.play(PreLoader.HACKING_KEY_PRESSED)
		

func change_visibility():
	if visible:
		hide()
	else:
		show()
		line_edit.grab_focus()
		accept_event()

		
func on_text_changed(new_text):
	pass
	

func on_text_submitted(new_text):
	text_edit.text += new_text + "\n" 
	line_edit.clear()
	# do not accept empty or space
#	AudioManager.play(PreLoader.HACKING_DENIED)
