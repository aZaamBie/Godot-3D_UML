extends Node3D

# https://www.youtube.com/watch?v=mJRDyXsxT9g

var cam_
var user_
var targetObj

var mainPos3D : Vector3
var mousePos
var screenPos # mouse position in 2D / Windowed environment
var screenPos_3D : Vector3 # mouse position in the 3D environment (Vector 3)
var rayArray
var rayCollider


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	user_ = get_tree().current_scene
	cam_ = get_tree().get_root().get_camera_3d()
	print(cam_)

func _input(event):
	pass
	if event is InputEventMouseMotion: # for mouse motion only! Prevents other keys from being detected as event
		pass
		#handle()
		
		#screenPos = event.position # updates every time the mouse moves
		#screenPos_3D = cam_.project_position(screenPos,1.0) #
		#self.global_transform.origin = screenPos_3D #
		
		if !castRay().is_empty():
			pass
			mainPos3D = castRay()["position"]
	
	if event is InputEventMouseButton and event.is_pressed(): # detect mouse buttons
		if event.button_index == MOUSE_BUTTON_LEFT:
			var tgtPos
			tgtPos = mainPos3D
			tgtPos.z = 0.5
			#tgtPos = global_position
			#print(screenPos, " and ", screenPos_3D)
			print(tgtPos, " is the target position")
			#user_.spawnShape("rect", tgtPos) #o.g.
			
			if user_.mode_==0: 
				pass
				user_.toggleGrab()
				user_.setNewObject(targetObj)
			elif user_.mode_==1: # spawn shape
				pass
				user_.spawnShape("rect", tgtPos)
		
		elif event.button_index == MOUSE_BUTTON_RIGHT:
			pass
			print(castRay())
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	#handle()
	##screenPos_3D = mainCam_.project_position(screenPos,1.0)
	#self.global_transform.origin = screenPos_3D
	self.global_transform.origin = mainPos3D
	user_.mousePos3D  = mainPos3D # update the "global"/scene owner's mouse position

func castRay():
	var spaceState = get_world_3d().direct_space_state # get current 3D space
	mousePos = get_viewport().get_mouse_position() # get mouse position (2D)
	
	# define the arrays
	var rayLength = 1000
	var rayOrigin = cam_.project_ray_origin(mousePos)
	var rayEnd = rayOrigin + cam_.project_ray_normal(mousePos) * rayLength #
	
	var rayQuery = PhysicsRayQueryParameters3D.create(rayOrigin, rayEnd)
	var rayResult = spaceState.intersect_ray(rayQuery)
	#print(rayResult)
	
	return rayResult


#func _on_mouse_area_body_entered(body):
	#pass # Replace with function body.
	##if body.is_in_group("shpCLASS"):
		##print("entered class")

	#if body.is_in_group("object3D"):
		#targetObj = body
		#print("entered object 3D")

#func _on_mouse_area_body_exited(body):
	#pass # Replace with function body.
	#if body.is_in_group("object3D"):
		#targetObj = null
		#print("entered object 3D")

## LMB
func _on_mouse_area_lmb_body_entered(body):
	if body.is_in_group("object3D"):
		targetObj = body
		print("entered object 3D")
func _on_mouse_area_lmb_body_exited(body):
	if body.is_in_group("object3D"):
		targetObj = null
		print("entered object 3D")

## RMB


func _on_mouse_area_rmb_body_entered(body):
	pass # Replace with function body.
	if body.is_in_group("editable"):
		print("entered edtiable")
func _on_mouse_area_rmb_body_exited(body):
	pass # Replace with function body.
