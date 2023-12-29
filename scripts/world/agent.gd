extends Area2D
class_name Agent

##  handle user input when under user control, until find better place to handle it
##  navigation: moving from waypoint to waypoint and dodge things along the way
##  filling needs based on data.needs

@export var data : AgentData

var linear_velocity = Vector2.ZERO

@onready var mag_north_line = $DirectionalLines/MagNorthLine
@onready var grid_north_line = $DirectionalLines/GridNorthLine
@onready var mouse_line = $DirectionalLines/MouseLine

@onready var selection_rect: ReferenceRect = $SelectionRect


func  _ready() -> void:
	area_entered.connect(_on_area_entered)
	
 
func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			if data.current_status == Enums.AgentStatus.CONTROLLED:
				set_course()
				get_viewport().set_input_as_handled()
				

func _input_event(viewport: Viewport, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton:
		if data.current_status != Enums.AgentStatus.CONTROLLED:
			if event.double_click and event.pressed:
				print("agent double clicked")
				control_agent()
				get_viewport().set_input_as_handled()
			# - this is here so controlled agent don't move toward clicked
			# 	agent when double clicking it
			# TODO: physics pickable obj is last in input propagation order
			# 		so might be useless, consider removal
			if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
				print("agent clicked")
				get_viewport().set_input_as_handled()
				
							

func _mouse_enter() -> void:
	selection_rect.show()
	Events.agent_mouse_entered.emit(data)
	

func _mouse_exit() -> void:
	selection_rect.hide()
	Events.agent_mouse_exited.emit(data)


#func _process(delta: float) -> void:
# handle input here so work while paused? 
# see CollisionObject2D inspector properties 
	#pass


#func _unhandled_input(event: InputEvent) -> void:
	#if current_status == Status.CONTROLLED:
		#if event is InputEventMouseButton:
			#if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
					#rotation += get_local_mouse_position().angle()


func _physics_process(delta) -> void:
	if data.current_status != Enums.AgentStatus.DISABLED:
		move_forward(delta)

	
#func get_next_task():
	# find next best move/priority, like what need fullfill or what to buy
	#pass
	
	
#func path_to_task():
	# only relevant to agent AI navigation?
	# move to data? set value there?
	#pass
	
	
#func get_next_dir_from_path():
	# get_dir_to? movement_direction? bearing? heading? vector?
	#if distance to waypoint <= x:
	#	get next waypoint
	# set rotation to dir to next waypoint
	#pass
	

func move_forward(delta):
	position += transform.x * 10 * delta
	data.position = position


func _on_area_entered(area):
	if Enums.AgentStatus.CONTROLLED:
		Events.user_agent_area_entered.emit(area)


func set_course():
	#rotation = get_local_mouse_position().rotated(rotation).angle()
	#rotation = global_position.direction_to(get_global_mouse_position()).angle()
	rotation = (get_global_mouse_position() - global_position).angle()
	data.rotation = rotation
	print("course set")
	

func control_agent():
	data.current_status = Enums.AgentStatus.CONTROLLED
	Events.user_agent_set.emit(self)			
	Events.user_agent_set.connect(_on_user_agent_set)


func release_agent():
	data.current_status = Enums.AgentStatus.DISABLED
	Events.user_agent_set.disconnect(_on_user_agent_set)


func _on_user_agent_set(agent):
	release_agent()
	
#func update_debug_draw():
	#pass
# use direction_to instead?
#$DirectionalLines.global_position = agent_global_position
#mouse_line.global_rotation = agent_to_mouse_dir.angle()
#grid_north_line.global_rotation = Vector2.UP.angle()
#mag_north_line.global_rotation = mag_north_dir.angle()


#func _unhandled_input(event):
#	if event is InputEventMouseButton:
#		if event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
#			set_course()

# make func that return agent_to_mouse so travel screen can call on mouse motion?
# 	shouldn't call func from another class if we can avoid
# 	do injection? feed user_agent_data res to travel screen,  
