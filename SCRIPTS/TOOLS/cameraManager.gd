extends Node3D

# https://www.youtube.com/watch?v=mJRDyXsxT9g

# CAMERA ROTATION
const ROT_SPEED = 0.003
const ZOOM_SPEED = 0.125

var rot_x = -TAU / 8# 16  # 
var rot_y = TAU / 8  # in sync w/ camPivot
var camera_distance = 2.0
#-

@export var mainCam : Camera3D
@export var axisLock : bool = false
@export var orbit_enabled : bool = false
@export_node_path var orbitTarget
@export var zoomLabel : Label

@export var moveSpeed : float = 0.1
var zoom : float = 1.0
@export var startPos : Vector3

var myDelta

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func init_():
	pass

func _input(event):
	## Scroll wheel - zooming in & out
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_WHEEL_UP): 
		mainCam.global_position.z -= 0.1
		#self.global_position.z -= 0.1
		moveSpeed -= 0.05 # adjust: decrease move speed when zooming in
		#zoom -= 0.02
	elif Input.is_mouse_button_pressed(MOUSE_BUTTON_WHEEL_DOWN): 
		mainCam.global_position.z += 0.1
		#self.global_position.z += 0.1
		moveSpeed += 0.05 # adjust: increase move speed when zooming out
		#zoom += 0.02
	
	## ORBITTING
	if orbit_enabled:
		if event is InputEventMouseMotion and Input.is_mouse_button_pressed(MOUSE_BUTTON_RIGHT):
			# Compensate motion speed to be resolution-independent (based on the window height).
			var relative_motion = event.relative * DisplayServer.window_get_size().y / 1080 # / base_height
			rot_y -= relative_motion.x * ROT_SPEED
			rot_x -= relative_motion.y * ROT_SPEED
			rot_x = clamp(rot_x, -1.57, 0) # clamp
			self.transform.basis = Basis.from_euler(Vector3(rot_x, rot_y, 0))
	else:
		pass
		if event is InputEventMouseMotion and Input.is_mouse_button_pressed(MOUSE_BUTTON_RIGHT):
			var relative_motion = event.relative * DisplayServer.window_get_size().y / 1080 # / base_height
			
			
			## If mouse motion in x axis is nonnegative, then move position according to the x-value
			if event.relative.x != 0:
				self.transform.origin += Vector3.LEFT * event.relative.x * moveSpeed * myDelta
			else: pass
			
			## If mouse motion in y axis is nonnegative, then move position according to the y-value
			if event.relative.y != 0:
				self.transform.origin += Vector3.UP * event.relative.y * moveSpeed * myDelta
			else: pass



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	myDelta = delta
	
	zoom = mainCam.global_position.z / 4
	#zoomLabel.text = String("Zoom: {value}.2f%").format({"value": zoom*100})
	zoomLabel.text = "Zoom: %.2f" % [zoom*100] + "%"
	
	self.global_position.z = clamp(mainCam.global_position.z,0.0,2)


func orbitTarget_select(target_):
	pass
	self.global_position.x = target_.global_position.x
	self.global_position.y = target_.global_position.y
