extends Button

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
# scene changing {           get_tree().change_scene("res://current_scene.tscn")            }
var annoyance = 0
var time = 0

func _ready():
	annoyance = 0
	
	
func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
	
	pass
	
func _on_Button_pressed():
	self.text="Press enter or space to begin!"
	if annoyance >= 1:
		print("stop")
	annoyance = 1+annoyance
	set_rotation(1)
	Global.Text = "hm............"

func _physics_process(delta):
	if Input.is_action_pressed("ui_accept") and Global.dialogue_active == false:
		Global.Level = 1 + Global.Level
	if annoyance == 10:
		print("JUST STOP IT!!!!!!!!!!!!!!!!   >:(")
	if annoyance == 20:
		print("Oh GOD just STOP!!!!!!!!!! it hurts!!!!!!!!!")
	if annoyance == 100:
		print("I BEG you. Just stop! Please ;-;")
	if annoyance >= 120:
		print("Fine")
		time = 1+time
	if time == 100:
		get_tree().quit()
	

