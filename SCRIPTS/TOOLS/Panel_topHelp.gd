extends Panel


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	initMenuButtons()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func initMenuButtons():
	# File
	$hbox/mbtnFile.get_popup().clear()
	$hbox/mbtnFile.get_popup().add_item("New")
	$hbox/mbtnFile.get_popup().add_item("Save")
	$hbox/mbtnFile.get_popup().add_item("Close")
	
	# Edit
	$hbox/mbtnEdit.get_popup().add_item("Undo")
	
	## conect signals
	#$hbox/mbtnFile.get_popup().connect("id_pressed",self, "on_item_pressed")
	#$hbox/mbtnFile.get_popup().connect("id_pressed",Callable(self,"_on_item_pressed"))
	#$hbox/mbtnFile.get_popup().id_pressed.connect(_on_item_pressed.bind())
	#$hbox/mbtnFile.get_popup().id_pressed.connect(_on_menu_item_pressed)-
	$hbox/mbtnFile.get_popup().id_pressed.connect(selectItem_File)
	$hbox/mbtnEdit.get_popup().id_pressed.connect(selectItem_Edit)

func selectItem(id):
	print("item selected, ID: ", id)


func selectItem_File(id):
	match id:
		0: # New file == Clear scene
			pass
			var owner = get_tree().get_first_node_in_group("OWNER")
			owner.clearScene()
			print("scene should be clearing from ", owner.name)
		1: # Save file
			pass
		2: # Close
			pass
			get_tree().quit()
func selectItem_Edit(id):
	match id:
		0:
			pass
		1:
			pass
		2:
			pass
