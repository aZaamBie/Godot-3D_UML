extends Node3D

@onready var mousePos = $camPiv/mouseHandle

var mode_

var grabbingObject : bool = false
var selectedObject

var shape_ : int = 0
var shpRectangle = preload("res://SCENES/Shapes/shp_rectangle.tscn")

var mousePos3D : Vector3


func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	if grabbingObject and selectedObject!=null:
		pass
		selectedObject.global_transform.origin = mousePos3D
		selectedObject.position.z = 0.5
	else:
		pass
		

func toggleGrab():
	if !grabbingObject:
		selectedObject = null
	
	grabbingObject = !grabbingObject
	print("grab toggled, status: " + str(grabbingObject) )
func grabObject():
	pass
func setNewObject(newObj):
	pass
	selectedObject = newObj


func spawnShape(shp_, pos:Vector3):
	pass
	await get_tree().create_timer(0.1).timeout # 0.1
	if mode_==1: ## if the current mode is the "add shape" mode, then proceed
		pass
		print(shape_, " is shape")
		match shape_: # shp_
			0:
				pass
				var rect = preload("res://SCENES/Shapes/shp_rectangle.tscn").instantiate(PackedScene.GEN_EDIT_STATE_MAIN)
				selectedObject = rect
			1:
				pass
				var class01 = preload("res://SCENES/Shapes/shp_class_01.tscn").instantiate(PackedScene.GEN_EDIT_STATE_MAIN)
				selectedObject = class01
			_:
				pass
				var rect = preload("res://SCENES/Shapes/shp_rectangle.tscn").instantiate(PackedScene.GEN_EDIT_STATE_MAIN)
				selectedObject = rect
		
		# spawn child in scene
		$OBJ.add_child(selectedObject)
		# transport object to desired position + lock z axis
		selectedObject.global_transform.origin = pos
		selectedObject.position.z = 0.5
		# add to groups, to handle hordes of shapes better
		addToGroup(selectedObject, "shape")
		addToGroup(selectedObject, "object3D")
		

func updateMode(newMode):
	mode_ = newMode
	#print(mode_, " after ", newMode)

func addToGroup(object, Group_:String):
	object.add_to_group(Group_)

func clearScene():
	for object in get_tree().get_nodes_in_group("object3D"):
		object.queue_free
