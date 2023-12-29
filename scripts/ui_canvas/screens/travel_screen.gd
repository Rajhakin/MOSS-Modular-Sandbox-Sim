extends Control

signal clicked(point)
signal button_pressed(button)

# consider moving this to some world settings global since other components
# 	might need it
## offset from grid north in degrees
@export_range(-80.0, 80.0, 0.1, "radians") var mag_dec_offset = 0.0

var user_agent_data : AgentData
var label_offset = Vector2(10, -20)

#region Node References
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
#endregion


func _ready():
	connect_signals()	
	fade_in()
	
	
func _process(delta):
	update_diplay_values()
	update_label_position()
	
	if user_agent_data:
		update_label_text()
	

func connect_signals():
	Events.user_agent_set.connect(_on_user_agent_set)
	
	var buttons = [settings_button, caravan_button, map_button,	pause_button,
			fast_forward_button]
			
	for i in buttons:
		i.pressed.connect(_on_button_pressed.bind(i))


func update_diplay_values():
	var date_time = Time.get_datetime_dict_from_system()
	
	var date = [date_time.day, date_time.month, date_time.year]
	date_display.value = date
	
	var time = [date_time.hour, date_time.minute]
	time_display.value = time
	

## label show difference between dir_to_mouse to magnetic_north angles
func update_label_text():
	var angle = get_angle_to_mag_north()
	# the result we get is negative on the right side,but  we need it to be 
	# positive for when we add 2PI to wrap it, so we invert it by multpling by -1
	angle = angle * -1
	
	# wraps angle so keep increasing after 180 degrees instead of going into negatives
	if angle < 0:
		angle += 2 * PI

	#TODO something is rounding angle, can't have that
	angle_label.text = str("%.1f" % rad_to_deg(angle), "°", " ", "(%.1f" % angle + "°)")


func update_label_position():
	var label_max_pos = size - angle_label.size
	var label_pos = get_local_mouse_position() + label_offset
	angle_label.position = label_pos.clamp(Vector2.ZERO, label_max_pos)



# getting dir to mouse from user's agent, either by calling directly or
#	getting from it's data would be simpler to understand than this 
func get_angle_to_mag_north():
	var screen_center = get_viewport_rect().size / 2
	
	var center_to_mouse_vec = (get_local_mouse_position() - screen_center)
	# same as above but normalized
	# - obj rotation doen't matter when using positions 
	# - use get global_mouse instead or rotate(-rot)?
	var center_to_mouse_dir = screen_center.direction_to(get_local_mouse_position())
	
	var camera_rot_offset = deg_to_rad(90)
	# to account for camera's rotation offset
	var rotated_center_to_mouse_dir = center_to_mouse_dir.rotated(camera_rot_offset)
	
	var agent_rot = user_agent_data.rotation
	# to account for user_agent's rotation offset
	rotated_center_to_mouse_dir = rotated_center_to_mouse_dir.rotated(agent_rot)
	
	var agent_pos = user_agent_data.position
	var global_mouse_position = agent_pos + rotated_center_to_mouse_dir

	var agent_to_global_mouse_dir = agent_pos.direction_to(global_mouse_position)
	
	var mag_north_dir = Vector2.UP.rotated(mag_dec_offset)
	var angle_to_mag_north = agent_to_global_mouse_dir.angle_to(mag_north_dir)
	
	# global rotation can be useful? maybe on agent
	return angle_to_mag_north


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
		fast_forward_button:
			pass
				

func _on_user_agent_set(agent):
	user_agent_data = agent.data
	"travel screen: user agent set"
	

func fade_in():
	animation_player.play("fade_in")
	var duration = animation_player.current_animation_length
	return duration
	

func fade_out():
	animation_player.play("fade_out")
	var duration = animation_player.current_animation_length
	return duration

	
	
	
