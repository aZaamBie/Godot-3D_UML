extends Panel


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	initMenuButtons()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_btn_file_pressed():
	pass # Replace with function body.
	#print("button pressed")
	#$hbox/mbtnFile.get

func initMenuButtons():
	# File
	$hbox/mbtnFile.get_popup().add_item("New")
	$hbox/mbtnFile.get_popup().add_item("Save")
	$hbox/mbtnFile.get_popup().add_item("Close")
	
	# Edit
	$hbox/mbtnEdit.get_popup().add_item("Undo")
	
	## conect signals
	#$hbox/mbtnFile.get_popup().connect("id_pressed",self, "on_item_pressed")
	#$hbox/mbtnFile.get_popup().connect("id_pressed",Callable(self,"_on_item_pressed"))
	#$hbox/mbtnFile.get_popup().id_pressed.connect(_on_item_pressed.bind())
	$hbox/mbtnFile.get_popup().id_pressed.connect(_on_menu_item_pressed.bind())

func _on_menu_item_pressed():
	pass
	print("item pressed")
