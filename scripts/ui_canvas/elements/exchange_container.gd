extends PanelContainer


signal exchange_item_pressed(itemdData: ItemData)

@onready var itemContainer = $VBoxContainer/MarginContainer/VBoxContainer


#var items: Array[ItemData] = []
#	if itemData not in items:

func _ready():
	$VBoxContainer/PanelContainer/Label.text = name


func add_item(itemData: ItemData):
	# check if entry already exists, 
	for i in itemContainer.get_children():
		if i.itemData == itemData:
			i.queue_free()
			return
	
	# if not add to item list then instantiate itemData's InventoryItem object
	var newItemInstance = PreLoader.EXCHANGE_ITEM.instantiate()
	newItemInstance.itemData = itemData
	itemContainer.add_child(newItemInstance)	
	newItemInstance.textureButton.pressed.connect(onItemPressed.bind(newItemInstance.itemData))


func onItemPressed(itemData: ItemData):
	exchange_item_pressed.emit(itemData)

