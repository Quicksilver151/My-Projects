extends Node2D

var position_1 = Vector2()

func move(target):
	var move_tween = get_node("Tween")
	move_tween.interpolate_property(self, "position" , position , target, 1, Tween.TRANS_EXPO,Tween.EASE_OUT_IN)
	move_tween.start()
