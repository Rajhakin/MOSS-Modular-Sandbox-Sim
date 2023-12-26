extends Control


signal clicked(point)
signal button_pressed(button)

# consider moving this to some world settings global since other components
# 	might need it
## offset from grid north in degrees
@export_range(-80.0, 80.0, 0.1, "radians") var mag_dec_offset = 0.0

var agent_global_position = Vector2.ZERO
var label_offset = Vector2(10, -20)
var agent_to_mouse_dir = agent_global_position.direction_to(get_global_mouse_position())

@onready var angle_label: Label = $AngleLabel
@onready var animation_player: AnimationPlayer = $AnimationPlayer
# SCREEN PANEL BUTTONS
@onready var settings_button: Button = %SettingsButton
@onready var caravan_button: Button = %CaravanButton
@onready var map_button: Button = %MapButton
# TIME PANEL BUTTONS
@onready var pause_button: Button = %PauseButton
@onready var fast_forward_button: Button = %FastForwardButton
# RESOUCE PANEL DISPLAYS
@onready var water_display: PanelContainer = %WaterDisplay
@onready var food_display: PanelContainer = %FoodDisplay
@onready var grass_display: PanelContainer = %GrassDisplay
@onready var fuel_display: PanelContainer = %FuelDisplay
# TIME PANEL DISPLAYS
@onready var date_display: PanelContainer = %DateDisplay
@onready var time_display: PanelContainer = %TimeDisplay


func _ready():
	var buttons = [settings_button, caravan_button, map_button, pause_button]
	for i in buttons:
		i.pressed.connect(_on_button_pressed.bind(i))
		fade_in()
	

#func _gui_input(event):
	#if event is InputEventMouseButton:
		#if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			#DisplayServer.mouse_get_position()?
			#clicked.emit(agent_to_mouse_dir)
			#get_tree().paused = false
			#print("gui clicked")


func _process(delta):
	_update_diplay_values()
	_update_label_text()
	_update_label_position()
	
	
func _update_diplay_values():
	var date_time = Time.get_datetime_dict_from_system()
	
	var date = [date_time.day, date_time.month, date_time.year]
	date_display.value = date
	
	var time = [date_time.hour, date_time.minute]
	time_display.value = time

	

func on_user_agent_moved(new_pos):
	agent_global_position = new_pos


## label show difference between dir_to_mouse to magnetic_north angles
func _update_label_text():
	var angle = _get_angle_to_mag_north()
#	wraps angle
	if angle < 0:
		angle += 2 * PI

	angle_label.text = str("%.1f" % rad_to_deg(angle), "°", " ", "(%.1f" % angle + "°)")
# something is rounding angle, can't have that


func _update_label_position():
	var label_max_pos = size - angle_label.size
	var label_pos = get_local_mouse_position() + label_offset
	angle_label.position = label_pos.clamp(Vector2.ZERO, label_max_pos)

# keep code in radian, display in degrees
func _get_angle_to_mag_north():
	agent_to_mouse_dir = agent_global_position.direction_to(get_global_mouse_position())# agnt.get_mos_glbl?
	var mag_north_dir = Vector2.UP.rotated(mag_dec_offset)
	var angle_to_mag_north = agent_to_mouse_dir.angle_to(mag_north_dir)
	
	
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
		
		

func fade_in():
	animation_player.play("fade_in")
	var duration = animation_player.current_animation_length
	return duration
	

func fade_out():
	animation_player.play("fade_out")
	var duration = animation_player.current_animation_length
	return duration

	
	
	
