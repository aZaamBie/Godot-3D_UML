extends StaticBody3D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


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
