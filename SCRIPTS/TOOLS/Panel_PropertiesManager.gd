extends Panel

var user_
var currentShape_ = null
var custom_scale : Vector3
var custom_color 

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	user_ = get_tree().current_scene
	
	# connect buttons
	$compnentTab/Fields/btnIncreaseHeight.pressed.connect(self.increaseHeight.bind("field"))
	$compnentTab/Fields/btnDecreaseHeight.pressed.connect(self.decreaseHeight.bind("field"))
	
	$compnentTab/Methods/btnIncreaseHeight.pressed.connect(self.increaseHeight.bind("method"))
	$compnentTab/Methods/btnDecreaseHeight.pressed.connect(self.decreaseHeight.bind("method"))
	
	$compnentTab/Fields/fieldEdit.text_changed.connect(self.setText.bind("field"))
	$compnentTab/Methods/methodEdit.text_changed.connect(self.setText.bind("method"))
	
	
	#$compnentTab/Fields/fieldEdit.text_changed.connect(self.setText.bind($compnentTab/Fields/fieldEdit.text))
	#$compnentTab/Fields/methodEdit.text_changed.connect(self.setText.bind($compnentTab/Fields/methodEdit.text))
	# "field"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func open_(obj_):
	show()
	if obj_!=null:
		currentShape_ = obj_
		if currentShape_.is_in_group("shpCLASS"):
			$vboxProp/lblColour/ColorPickerButton.color = currentShape_.MAT_body.albedo_color
func close_():
	hide()


func _on_slid_x_value_changed(value):
	custom_scale.x = value
	
	if currentShape_.has_method("setScale"):
		currentShape_.setScale("X", value) # NEW
	else:
		currentShape_.scale.x = value  # OLD


func _on_slid_y_value_changed(value):
	custom_scale.y = value
	
	if currentShape_.has_method("setScale"):
		currentShape_.setScale("Y", value) # NEW
	else:
		currentShape_.scale.y = value     # OLD
		


func _on_color_picker_button_color_changed(color):
	custom_color = color
	
	# check if selectedObject exists, and has the variable "MAT_body", to be able to change colour
	if (currentShape_!=null) and ("MAT_body" in currentShape_):
		currentShape_.MAT_body.albedo_color = custom_color


func _on_title_edit_text_changed():
	if (currentShape_!=null):
		#currentShape_.setTitle($TabContainer/Title/titleEdit.text) # OLD
		currentShape_.setTitle($compnentTab/Title/titleEdit.text) # NEW


func _on_atr_edit_text_changed():
	if currentShape_!=null:
		currentShape_.setField($TabContainer/Attributes/atrEdit.text)
		currentShape_.setField($compnentTab/Fields/fieldEdit.text)


func _on_tab_container_tab_changed(tab):
	if currentShape_!=null:
		$TabContainer/Title/titleEdit.text = currentShape_.getTitle()

func _on_txt_btn_mouse_entered():
	pass # Replace with function body.
	print("mouse entered")
	#$TabContainer.show()


func _on_tab_container_mouse_exited():
	pass # Replace with function body.
	print("mouse exited")
	$TabContainer.hide()

func increaseHeight(property:String):
	pass
	print(property, ": increase height")
	if currentShape_!=null:# and currentShape_.has_method("modifyProperty"):
		print(currentShape_, " is found; will modify")
		currentShape_.modifyProperty(property, 1)
	
	#match property:
		#"field":
			#pass
		#"method":
			#pass
	#currentShape_.modifyProperty("field", +1)
func decreaseHeight(property:String):
	pass
	print(property, ": decrease height")
	if currentShape_!=null and currentShape_.has_method("modifyProperty"):
		currentShape_.modifyProperty(property, -1)
	
	#currentShape_.modifyProperty("field", -1)

func setText(type:String): # func setText(text:String, type:String):
	pass
	if currentShape_!=null:
		#print("text should change on ", type)
		match type:
			"field":
				currentShape_.setField($compnentTab/Fields/fieldEdit.text)
				print("the fields should change to: ", $compnentTab/Fields/fieldEdit.text)
			"method":
				currentShape_.setMethods($compnentTab/Methods/methodEdit.text)

func _on_component_btn_pressed():
	$compnentTab.visible = !$compnentTab.visible
