extends StaticBody3D

var color_
var MAT_body
var MAT_title


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	init_()

func init_():
	MAT_body = StandardMaterial3D.new() # create new material
	MAT_body.albedo_color = Color.WHITE_SMOKE # assign color
	color_ = MAT_body.albedo_color # assign color above to variable
	#mesh_.material_override = MAT_
	$bodyAtr.material_override = MAT_body

func _process(delta):
	pass

## getters
func getTitle():
	return $lblTitle.text
func getAttribute():
	return $lblAtr.text
func getMethods():
	pass

## setters
func setTitle(newText:String):
	$lblTitle.text = newText
func setAttr(newText:String):
	$lblAtr.text = newText
	

func _on_detect_title_mouse_entered():
	pass # Replace with function body.
	print("mouse entered")
	#$UI/LineEdit.show()
func _on_detect_title_mouse_exited():
	pass # Replace with function body.
	print("mouse left")
	$UI/LineEdit.hide()

func _on_detect_title_body_entered(body):
	pass # Replace with function body.
	if body.is_in_group("mouse"):
		pass
		print("mouse entered title editor")
