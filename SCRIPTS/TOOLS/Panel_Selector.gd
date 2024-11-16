extends Panel

###--- FIELDS ---###
enum Modes{
	SELECT,
	SHAPE,
	LINE,
	TEXT
}

var user_
var currentMode

## BUTTON GROUP! THIS WILL REPLACE THE WONKY SYSTEM OF BUTTON SELECTION
# https://www.youtube.com/watch?v=rwxHN25PFGQ


###--- METHODS ---###
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


## SIGNALS
func _on_btn_select_pressed():
	currentMode = Modes.SELECT
	updateUserMode()

func _on_option_button_item_selected(index):
	user_.shape_ = index
	currentMode = Modes.SHAPE
	updateUserMode()


func simulatePress(button):
	match button:
		"Select":
			#$hbox/btnSelect.toggle_mode = true
			#$hbox/btnSelect.button_pressed = true

			currentMode = Modes.SELECT
			
	updateUserMode()
