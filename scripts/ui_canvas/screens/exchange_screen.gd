extends Control


signal button_pressed(button)

@export var user_agent_inv : AgentData

# will obj ref be lost and this broke if delete node?
var data_obj_map 


@onready var caravan_inventory = %CaravanGoods
@onready var caravan_exchange = %Sell

@onready var trader_inventory = %TraderGoods
@onready var trader_exchange = %Buy

@onready var animation_player = $AnimationPlayer


func _ready():
	trader_inventory.inventory_item_pressed.connect(trader_exchange.add_item)
	caravan_inventory.inventory_item_pressed.connect(caravan_exchange.add_item)
	trader_exchange.exchange_item_pressed.connect(trader_inventory.on_exchange_item_pressed)
	caravan_exchange.exchange_item_pressed.connect(caravan_inventory.on_exchange_item_pressed)


func populate_inventories(inv_data: AgentData):
	for i in user_agent_inv.items:
		caravan_inventory.add_item(i)
	for i in inv_data.items:
		trader_inventory.add_item(i)


func fade_in():
	show()
	animation_player.play("fade_in")
	var duration = animation_player.current_animation_length
	return duration
	

func fade_out():
	animation_player.play("fade_out")
	var duration = animation_player.current_animation_length
	return duration


func _on_user_agent_set(agent):
	user_agent_inv = agent.data.items



