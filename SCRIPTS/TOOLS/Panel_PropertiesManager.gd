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


func open_():
	pass
	show()
func close_():
	hide()


func _on_slid_x_value_changed(value):
	pass # Replace with function body.
	#custom_scale = Vector3(value,value,value)
	custom_scale.x = value


func _on_slid_y_value_changed(value):
	pass # Replace with function body.
	custom_scale.y = value


func _on_color_picker_button_color_changed(color):
	pass # Replace with function body.
	custom_color = color
