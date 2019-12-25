extends Node2D


func _ready():
	Global.Level = 1
	Global.Text = "Behold!.... I AM the light!"
	yield(get_tree().create_timer(20.0), "timeout")
	Global.Text = "This really is kind of cool"

