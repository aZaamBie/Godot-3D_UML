extends Node3D

@onready var mousePos = $mouseHandle

var mode_


var selectedObject
var shpRectangle = preload("res://SCENES/Shapes/shp_rectangle.tscn")


func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func spawnShape(shp_, pos:Vector3):
	pass
	await get_tree().create_timer(0.1).timeout # 0.1
	if mode_==1: ## if the current mode is the "add shape" mode, then proceed
		pass
		match shp_:
			0:
				pass
				var rect = preload("res://SCENES/Shapes/shp_rectangle.tscn").instantiate(PackedScene.GEN_EDIT_STATE_MAIN)
				selectedObject = rect
			1:
				pass
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
