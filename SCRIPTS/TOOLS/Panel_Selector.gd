extends Panel

enum Modes{
	SELECT,
	SHAPE,
	LINE,
	TEXT
}

var user_
var currentMode

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	user_ = get_tree().current_scene
	print(user_, " is the user")
	currentMode = Modes.SELECT


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func updateUserMode():
	user_.updateMode(currentMode)

func _on_btn_select_pressed():
	pass # Replace with function body.
	currentMode = Modes.SELECT
	updateUserMode()


func _on_option_button_item_selected(index):
	user_.shape_ = index
	currentMode = Modes.SHAPE
	updateUserMode()
