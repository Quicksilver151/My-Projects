extends RichTextLabel
var initial_vector_location = Vector2(-250,260)
var final_vector_location = Vector2(-250,70)

func _process(delta):
	visible_characters = Global.outputtextvisible
	$ColorRect.visible = Global.box_visible
	text = Global.dialogue
	visible_characters = Global.outputtextvisible
	Global.texttyping(1)
	
	if Global.dialogue_active == true:
		get_parent().move(Vector2(0,0))
	else:
		get_parent().move(Vector2(0,400))
