extends StaticBody3D

var color_
var MAT_body
var MAT_title

var atrSize : Vector2 = Vector2(1,1)
var methodSize : Vector2 = Vector2(1,1)

@onready var bodyField = $collBody1/bodyField
@onready var bodyMethod = $collBody2/bodyMethods
@onready var lblTitle = $collHead/lblTitle
@onready var lblField = $collBody1/lblField
@onready var lblMethods= $collBody2/lblMethod

func _ready():
	init_()

func init_():
	MAT_body = StandardMaterial3D.new() # create new material
	MAT_body.albedo_color = Color.WHITE_SMOKE # assign color
	color_ = MAT_body.albedo_color # assign color above to variable
	
	bodyField.material_override = MAT_body

func _process(delta):
	pass
	#if Engine.get_process_frames() % 30 == 0: # checks whether x # of frames have passed since last comparison
		#pass


## getters
func getTitle():
	return lblTitle.text
func getAttribute():
	return lblField.text
func getMethods():
	return lblMethods.text

## setters
func setTitle(newText:String):
	lblTitle.text = newText
func setAttr(newText:String):
	lblField.text = newText
func setMethods(newText:String):
	lblMethods.text = newText

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

func setScale(plane:String, amount:float):
	match plane:
		"X": self.scale.x = amount
		"Y": self.scale.y = amount
	orientScale()

## misc
var tempScale = 1.0
func orientScale():
	
	for i in get_children():
		if i is Label3D:
			pass
			## if ownerScale = 1.1, then iScale = 0.9; oScale = 1.2, then iScale = 0.8
			
			## 1.0 = (owner + i) /2
			### iScale = 2 - ownerScale
			
			i.scale = Vector3(2,2,2) - self.scale
			
			i.scale = clamp(i.scale, Vector3(0.5,1,1), Vector3(1.2,1.0,1.0)) # clamp, to prevent from scaling out of existence
			#i.scale = clamp(i.scale, Vector3(0.8,0.8,0.8), Vector3(1.2,1.2,1.2)) # clamp, to prevent from scaling out of existence
			
			print(i.scale, " Is the current scale.")

func modifyProperty(type:String, operation : int = 1):
	## operation parameter should either be +1 (for adding) or -1 (for removing)
	
	## ratio of 6:1
	# scale = 1.5, then pos = -0.25 ||| scale = 0.5, then pos = 0.25;
	
	match type:
		"field":
			pass
			# scale changes
			#$collBody1.scale.x += 0.5 * operation
			$collBody1.scale.y += 0.5 * operation
			
			# position changes
			$collBody1.position.y += 0.25 * -operation
			
			$lblField.position = $collBody1.position
			
			
		"method":
			pass
