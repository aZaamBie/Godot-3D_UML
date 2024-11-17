extends StaticBody3D

@onready var lblTitle = $lblTitle

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func setTitle(newText:String):
	lblTitle.text = newText
func getTitle():
	return lblTitle.text
