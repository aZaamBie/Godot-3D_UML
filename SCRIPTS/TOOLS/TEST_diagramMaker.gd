extends Node3D

@onready var mousePos = $camPiv/mouseHandle
@onready var PNL_properties = $UI/pnlProperties

var mode_

var grabbingObject : bool = false
var inpectingProperties : bool = false
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
	
	grabbingObject = !grabbingObject # change boolean
	print("grab toggled, status: " + str(grabbingObject) ) #print trace
func disableGrab():
	grabbingObject = false
func grabObject():
	pass

func setNewObject(newObj):
	selectedObject = newObj

func openPanel_():
	$UI.openProperties(selectedObject)
	inpectingProperties = true
func closePanel_():
	$UI.closeProperties()
	inpectingProperties = false

func spawnShape(shp_, pos:Vector3):
	pass
	await get_tree().create_timer(0.1).timeout # 0.1
	if mode_==1: ## if the current mode is the "add shape" mode, then proceed
		pass
		#print(shape_, " is shape")
		match shape_: # shp_
			0:
				var rect = preload("res://SCENES/Shapes/shp_rectangle.tscn").instantiate(PackedScene.GEN_EDIT_STATE_MAIN)
				selectedObject = rect
			1:
				var class01 = preload("res://SCENES/Shapes/shp_class_01.tscn").instantiate(PackedScene.GEN_EDIT_STATE_MAIN)
				selectedObject = class01
			2:
				var actor01 = preload("res://SCENES/Shapes/actor._01tscn.tscn").instantiate(PackedScene.GEN_EDIT_STATE_INSTANCE)
				selectedObject = actor01
			_:
				var rect = preload("res://SCENES/Shapes/shp_rectangle.tscn").instantiate(PackedScene.GEN_EDIT_STATE_MAIN)
				selectedObject = rect
		
		## spawn child in scene
		$OBJ.add_child(selectedObject)
		## transport object to desired position + lock z axis
		selectedObject.global_transform.origin = pos
		selectedObject.position.z = 0.5
		## add to groups, to handle hordes of shapes better
		addToGroup(selectedObject, "shape")
		addToGroup(selectedObject, "object3D")
		
		## at the end, set the mode to select. This prevents user from spam-spawning elements
		#mode_ = 0;
		$UI/pnlSelector.simulatePress("Select")
		

func updateMode(newMode):
	mode_ = newMode

func addToGroup(object, Group_:String):
	object.add_to_group(Group_)

func clearScene():
	for object in get_tree().get_nodes_in_group("object3D"):
		object.queue_free
