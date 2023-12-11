# make this a class for autocomplete sake

# move drag code to selection? selectionController.start/end Dragging/selection
# what's the point of just receiving mouse inputs here if we aren't controlling
# the flow, might as well move all to selection controller, 
# we should compare selectionState when we receive input, then call or set 
# appropriate things

# detect all inputs here and emit to relevant place, or use the old way, 
# detect input on each script as needed and match current state

extends Node2D


# KEYBOARD_INPUT
var is_control_pressed:= false
var is_shift_pressed:= false

var input_dir:= Vector2.ZERO
var input_rot:= 0

# MOUSE_INPUT
var currFramePos: Vector2
var lastFramePos: Vector2

@onready var canvas_ui = $"%CanvasUI"


func _unhandled_input(event):
	if event is InputEventMouseButton:		
		if event.is_action_pressed("mouse_right"):
			# quit curr screen/emulate back button pressed
			# better have a close() on each ui screen, keep track of focused 
			# screen call on current screen, if exist is calle, if not nothing
			# happens, maybe of last screen as well, and have back() 
			pass
			
		if event.is_action_pressed("scroll_up"):
			# zoom out
			pass
			
		if event.is_action_pressed("scroll_down"):
			# zoom in
			pass
			
			




func _process(delta):	
	currFramePos = get_global_mouse_position()
	
	updateKeyboardInput()
	# TODO: updateCamera(), pan would work like selection's drag

	lastFramePos = get_global_mouse_position()


func updateKeyboardInput():
	input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
			
	input_rot = (
			Input.get_action_strength("rotate_right") - 
			Input.get_action_strength("rotate_left"))

	is_control_pressed = Input.is_action_pressed("control")
	
	is_shift_pressed = Input.is_action_pressed("shift")
	
#	Event.emit_signal("userInput",
#			input_dir, input_rot, is_control_pressed, is_shift_pressed)


func updateCursorMask():
	$CursorMask.position = get_global_mouse_position()
