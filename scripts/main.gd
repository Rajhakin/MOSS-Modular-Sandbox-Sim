extends Node

# pause and game state is main responsibilty
# other than that it just handle connectiong between world and ui

# should main be a singleton?

@onready var travel_screen = $CanvasUI/TravelScreen
@onready var canvas_ui = %CanvasUI


func _ready():
	init_user_agent()
	get_tree().paused = true

# should this be _init?
func init_user_agent():
	var user_agent = %World.spawn_agent(load("res://World/Units/user_agent.tscn"))
	%CanvasUI.user_agent = user_agent
	user_agent.moved.connect(travel_screen.on_user_agent_moved)
	travel_screen.clicked.connect(user_agent.on_travel_screen_clicked)
	user_agent.area_entered.connect(canvas_ui.on_user_agent_area_entered)
