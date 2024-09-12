extends Panel

var user_
var currentShape_ = null
var custom_scale : Vector3
var custom_color 

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	user_ = get_tree().current_scene


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func open_(obj_):
	pass
	show()
	if obj_!=null:
		currentShape_ = obj_
		$vboxProp/lblColour/ColorPickerButton.color = currentShape_.MAT_body.albedo_color
func close_():
	hide()


func _on_slid_x_value_changed(value):
	custom_scale.x = value
	
	currentShape_.scale.x = value


func _on_slid_y_value_changed(value):
	custom_scale.y = value
	
	currentShape_.scale.y = value


func _on_color_picker_button_color_changed(color):
	pass # Replace with function body.
	custom_color = color
	
	#user_.selectedObject.MAT_body.albedo_color = custom_color
	if currentShape_!=null:
		pass
		#print(currentShape_)
		currentShape_.MAT_body.albedo_color = custom_color


func _on_title_edit_text_changed():
	pass # Replace with function body.
	currentShape_.setTitle($TabContainer/Title/titleEdit.text)


func _on_atr_edit_text_changed():
	pass # Replace with function body.
	if currentShape_!=null:
		currentShape_.setAttr($TabContainer/Attributes/atrEdit.text)


func _on_tab_container_tab_changed(tab):
	pass # Replace with function body.
	if currentShape_!=null:
		$TabContainer/Title/titleEdit.text = currentShape_.getTitle()

func _on_txt_btn_mouse_entered():
	pass # Replace with function body.
	print("mouse entered")
	$TabContainer.show()


func _on_tab_container_mouse_exited():
	pass # Replace with function body.
	print("mouse exited")
	$TabContainer.hide()
