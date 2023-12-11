extends Control

"""
why not TradeScreen? why we changed?

here we handle communication between trader and caravan
	get their data and fill/populate respective inventory screens

the array would be the item resource data 
when player and trader overlap, call  TradeScreen(trader/object overlaped), 
	left panel will always be caravanGoods, only trader(right panel) changes
	
data shoudlnt be stored in ui controls so we can free/instance them without losing data
create playerData class, new, keep ref, or use res, 

make better tooltip, show more than just item name, consider rich text, 

 we could return something from exchange.addItem, so we know if sucess or 
 already exist or should we simply connect inv signal to exchange container func?
	or some way that we can return response if item was added or already exist
	so we toggle inv button off, that or we compare here, by having an array of 
	itemDatas, so the thinking, logic, the system is run here, then commands
	are sent down and signals received here,   

 emit signal with owner.name?

 this items array should be on pawns/global database, keep data separate from 
	game world, when they overlap trade screen apear and know what each of them
	has, hold their inventory arrays, all inventories database, pawns don't need
 	this information, they just illustrate/simulate position/places and transport
var items: Array[ItemData] = []

 we are assuming theres no duplicates in items[itemData] arrays,
	in Inventory and Table, make sure that duplicates doesnt happen 
 each data create one object, table check if theres no tableItem with provided
 data before creating, each stack reference must be unique to their global inv

 if similar item already exist, with same expiration, condition, merge the two
 	else create new inventory item, this compariso should happen when adding
	itemDatas to items array, not here, when confirming deal maybe, here we just
	add, don't question at this point, redundant, here all taht concerns us,
	the single responsibility is turning data into inventory_item
	
	whos gonna hold the agent/good array? 
		should make singleton to hold their data?
		
	consider trader/user_item_container and buy/sell container rather than exchange and inventory
	now that we are using inventory name for data
"""

signal button_pressed(button)

@export var user_agent_inv: AgentData

# will obj ref be lost and this broke if delete node?
var data_obj_map 

@onready var caravan_inventory = $PanelContainer/MarginContainer/HBoxContainer/CaravanGoods
@onready var caravan_exchange = $PanelContainer/MarginContainer/HBoxContainer/ExchangeArea/HBoxContainer/Sell

@onready var trader_inventory = $PanelContainer/MarginContainer/HBoxContainer/TraderGoods
@onready var trader_exchange = $PanelContainer/MarginContainer/HBoxContainer/ExchangeArea/HBoxContainer/Buy

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




