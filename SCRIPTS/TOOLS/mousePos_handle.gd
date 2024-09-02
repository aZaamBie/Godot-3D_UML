extends Node3D

var mousePos
var screenPos # mouse position in 2D / Windowed environment
var screenPos_3D : Vector3 # mouse position in the 3D environment (Vector 3)
var rayArray
var rayCollider


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func handle():
	pass
	var spaceState = get_world_3d().direct_space_state
	
	mousePos = get_viewport().get_mouse_position()
	var cam_ = get_tree().root.get_camera_3d() # get's the current / active camera
	
	var rayOrigin = cam_.project_ray_origin(mousePos)
	var rayEnd = rayOrigin + cam_.project_ray_normal(mousePos) * 2000 # from video #1
	
	rayArray = spaceState.intersect_ray(PhysicsRayQueryParameters3D.create(rayOrigin,rayEnd))
	
	# new test
	var physicsRaycastQuery = PhysicsRayQueryParameters3D.create(rayOrigin, rayEnd)
	var rayResult = spaceState.intersect_ray(physicsRaycastQuery)
