extends StaticBody3D

var color_
var MAT_body
var MAT_title


func _ready():
	pass # Replace with function body.
	init_()
	#orientScale()

func init_():
	MAT_body = StandardMaterial3D.new() # create new material
	MAT_body.albedo_color = Color.WHITE_SMOKE # assign color
	color_ = MAT_body.albedo_color # assign color above to variable
	#mesh_.material_override = MAT_
	$bodyAtr.material_override = MAT_body

func _process(delta):
	pass
	if Engine.get_process_frames() % 30 == 0: # checks whether x # of frames have passed since last comparison
		pass
		orientScale()
		# run the logic once every x frames. If 60 frame = 1 sec, then 30 frame = 0.5 sec, 20frame=0.3 sec and so on...
		#print("Checking idle frames")
	#Engine.get_process_frames()

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
	pass
	print("mouse entered")
	#$UI/LineEdit.show()
func _on_detect_title_mouse_exited():
	pass
	print("mouse left")
	$UI/LineEdit.hide()

func _on_detect_title_body_entered(body):
	pass # Replace with function body.
	if body.is_in_group("mouse"):
		pass
		print("mouse entered title editor")


## misc
var tempScale = 1.0
func orientScale():
	pass
	#var tempScale = 1.0
	
	for i in get_children():
		if i is Label3D:
			#print(i , "is a label 3d")
			
			## if ownerScale = 1.1, then iScale = 0.9; oScale = 1.2, then iScale = 0.8
			
			## 1.0 = (owner + i) /2
			### iScale = 2 - ownerScale
			
			#i.scale = 1.0
			#i.scale = Vector3(2,2,2) - self.scale
			
			tempScale = 2 - self.scale.x
			#print(tempScale, " is the tempScale of label: ", i)
		
