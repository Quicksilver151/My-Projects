extends Node2D

func _ready():
	Global.Level = 0
	Global.Text = "Not what I expected to see after a menu screen but ok."
	$Circle/Sprite/Light2D.visible = false