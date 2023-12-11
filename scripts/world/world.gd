extends Node2D


#signal user_agent_area_entered

#var user_agent
var world_scale: float = 4.0

@onready var background: Sprite2D = $Background
@onready var regions: Node2D = $Regions
@onready var agents: Node2D = $Agents


func _ready() -> void:
	scale_world()


func scale_world():
	background.scale *= world_scale
	
	for region in regions.get_children():
		for location in region.get_children():
			location.position *= world_scale
	
	for agent in agents.get_children():
		agent.position *= world_scale


func spawn_agent(agent = PreLoader.AGENT):
	var new_agent = agent.instantiate()
#	new_agent.area_entered.connect(_on_agent_area_entered.bind(new_agent))
	$Agents.add_child(new_agent)
	return new_agent
	

#func _on_agent_area_entered(area, agent):
#	if agent == user_agent:
#		user_agent_area_entered.emit(agent, area)
