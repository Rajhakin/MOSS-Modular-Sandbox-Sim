extends Control


"""
handle button sprite change here, before emiting signal

move directional lines to world ui? world ui layer goes on top of world and behind agents?


vector2(user_to_north_dir)angle_to(vector2(user_to_mouse))

var screen_center = size/2
# add user_agent_pos/agent_to_mouse here?
var center_to_mouse = get_local_mouse_position - screen_center
var global_mouse = user_agent_pos + center mouse
# do this above?
var agent_to_mouse = agent_pos - global_mouse
"""

signal clicked(point)
signal button_pressed(button)

# consider moving this to some world settings global since other components
# 	might need it
## offset from grid north in degrees
@export_range(-80.0, 80.0, 0.1, "radians") var mag_dec_offset = 0.0

var agent_global_position = Vector2.ZERO
var label_offset = Vector2(10, -20)
var agent_to_mouse_dir = agent_global_position.direction_to(get_global_mouse_position())

@onready var label = $MouseAngle
@onready var mag_north_line = $DirectionalLines/MagNorthLine
@onready var grid_north_line = $DirectionalLines/GridNorthLine
@onready var mouse_line = $DirectionalLines/MouseLine
@onready var animation_player = $AnimationPlayer
# SCREEN PANEL BUTTONS
@onready var settings_button = $ScreensPanel/MarginContainer/HBoxContainer/Button
@onready var caravan_button = $ScreensPanel/MarginContainer/HBoxContainer/Button2
@onready var map_button = $ScreensPanel/MarginContainer/HBoxContainer/Button3
# TIME PANEL BUTTONS
@onready var pause_button = $TimePanel/MarginContainer/HBoxContainer/Button
@onready var speed_button = $TimePanel/MarginContainer/HBoxContainer/Button2


func _ready():
	var buttons = [settings_button, caravan_button, map_button, pause_button]
	for i in buttons:
		i.pressed.connect(_on_button_pressed.bind(i))
		fade_in()
	

func _gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			#DisplayServer.mouse_get_position()?
			clicked.emit(agent_to_mouse_dir)
			get_tree().paused = false
			print("gui clicked")


func _process(delta):
	_update_label_text()
	_update_label_position()
	

func on_user_agent_moved(new_pos):
	agent_global_position = new_pos


## label show difference between dir_to_mouse to magnetic_north angles
func _update_label_text():
	var angle = _get_angle_to_mag_north()
#	wraps angle
	if angle < 0:
		angle += 2 * PI

	label.text = str("%.1f" % rad_to_deg(angle), "°", " ", "(%.1f" % angle + "°)")
# something is rounding angle, can't have that


func _update_label_position():
	var label_max_pos = size - label.size
	var label_pos = get_local_mouse_position() + label_offset
	label.position = label_pos.clamp(Vector2.ZERO, label_max_pos)

# keep code in radian, display in degrees
func _get_angle_to_mag_north():
	agent_to_mouse_dir = agent_global_position.direction_to(get_global_mouse_position())# agnt.get_mos_glbl?
	var mag_north_dir = Vector2.UP.rotated(mag_dec_offset)
	var angle_to_mag_north = agent_to_mouse_dir.angle_to(mag_north_dir)
	
	# use direction_to instead?
	$DirectionalLines.global_position = agent_global_position
	mouse_line.global_rotation = agent_to_mouse_dir.angle()
	grid_north_line.global_rotation = Vector2.UP.angle()
	mag_north_line.global_rotation = mag_north_dir.angle()
	
	return angle_to_mag_north * -1


func _on_button_pressed(button):
	match button:
		settings_button:
			pass
		caravan_button:
			pass
		map_button:
			pass
		pause_button:
			pass
		speed_button:
			pass
		
		

func fade_in():
	animation_player.play("fade_in")
	var duration = animation_player.current_animation_length
	return duration
	

func fade_out():
	animation_player.play("fade_out")
	var duration = animation_player.current_animation_length
	return duration

	
	
	
