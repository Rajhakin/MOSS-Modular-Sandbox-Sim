extends Marker2D

var target : AgentData

var zoom_default := Vector2(2, 2)
var zoom_min : Vector2  = zoom_default * 0.25
var zoom_max : Vector2 = zoom_default
var zoom_speed : Vector2 = zoom_default * 0.1

var drag_sensitivity : float = 1.0

var last_mouse_pos

@onready var screen_boundaries = get_viewport_rect().size
@onready var camera_2d : Camera2D = $Camera2D


func _input(event: InputEvent) -> void:
	if not target:
		if Input.is_action_just_pressed("mouse_middle"):
			# clear last_mouse_pos so we don't use outdated information
			# or set it if is the first time called and it's null
			last_mouse_pos = get_viewport().get_mouse_position().floor()
			print("middle just pressed")
							
		if event is InputEventMouseMotion \
				and Input.is_action_pressed("mouse_middle"):
			
			var curr_mouse_pos = get_viewport().get_mouse_position().floor()
			
			if is_out_of_bounds(curr_mouse_pos):
				# warp mouse position
				var wrapped_mouse_pos = wrap_mouse_pos(curr_mouse_pos)			
				get_viewport().warp_mouse(wrapped_mouse_pos)
				last_mouse_pos = wrapped_mouse_pos
			else:
				update_camera_pos(curr_mouse_pos)			
				last_mouse_pos = curr_mouse_pos
						
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_WHEEL_UP:
			camera_2d.zoom += zoom_speed
		elif event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
			camera_2d.zoom -= zoom_speed
			
		camera_2d.zoom = camera_2d.zoom.clamp(zoom_min, zoom_max)


func _ready() -> void:
	Events.user_agent_set.connect(_on_user_agent_set)


# use process instead?
func _physics_process(_delta : float) -> void:
	if target:# if instance valid? in case of deletion
		position = target.position
		rotation = target.rotation + deg_to_rad(90)


func is_out_of_bounds(mouse_pos):
	if (mouse_pos.x < 0
		or mouse_pos.x > screen_boundaries.x
		or mouse_pos.y < 0 
		or mouse_pos.y > screen_boundaries.y):
		print("mouse_OOB: %.v" % mouse_pos)
		return true
	
	return false


func wrap_mouse_pos(mouse_pos):	
	mouse_pos.x = wrap(mouse_pos.x, 0, screen_boundaries.x)
	mouse_pos.y = wrap(mouse_pos.y, 0, screen_boundaries.y)
	
	return mouse_pos


func update_camera_pos(mouse_pos):
	var mouse_delta = last_mouse_pos - mouse_pos
	var scaled_mouse_delta = mouse_delta / camera_2d.zoom
	# to account for camera rotation
	var rotated_mouse_delta = scaled_mouse_delta.rotated(rotation)
	
	position += rotated_mouse_delta * drag_sensitivity			


func _on_user_agent_set(agent):
	target = agent.data
