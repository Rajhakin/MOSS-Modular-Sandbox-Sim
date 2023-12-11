extends PanelContainer


signal inventory_item_pressed(item_data: ItemData)

@onready var grid = $VBoxContainer/ScrollContainer/MarginContainer/GridContainer
@onready var tab_bar = $VBoxContainer/TabBar


func _ready():
	tab_bar.tab_selected.connect(on_tab_selected)
	tab_bar.tab_hovered.connect(on_tab_hovered)


func add_item(item_data: ItemData):
	var new_item_instance = PreLoader.INVENTORY_ITEM.instantiate()
	new_item_instance.item_data = item_data
	grid.add_child(new_item_instance)	
	new_item_instance.button.pressed.connect(on_item_pressed.bind(new_item_instance.item_data))


func remove_item(item_data: ItemData):
	for i in grid.get_children():
		if i.item_data == item_data:
			i.queue_free()
			
func clear():
	for i in grid.get_children():
		i.queue_free()
		

func on_item_pressed(item_data: ItemData):
	inventory_item_pressed.emit(item_data)
	

# deselect pressed item
func on_exchange_item_pressed(item_data: ItemData):
	for i in grid.get_children():
		if i.item_data == item_data:
			i.button.button_pressed = false	
	

func on_tab_hovered(_tabIndex):
	AudioManager.play(PreLoader.PIPBOY_HIGHLIGHT)		
		
		
# triggered after tab switching to filter items of selected tab category
func on_tab_selected(tab_index: int):
	AudioManager.play(PreLoader.PIPBOY_SELECT)
	var tab_category: String = tab_bar.get_tab_title(tab_index)
	if tab_category == "All":
		for i in grid.get_children():
			i.show()
	else:
		for i in grid.get_children():
			if i.item_data.category == tab_category:
				i.show()
			else:
				i.hide()




