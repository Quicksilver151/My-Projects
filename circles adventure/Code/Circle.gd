extends KinematicBody2D


var velocity = Vector2(0,0)
export var speed = 500
#actual speed is 320
var speed_change_factor = 0.1


func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		Global.boost = true
		boost_topdown_movement(750)
		yield(get_tree().create_timer(1.5),"timeout")
		Global.boost = false
	
#	if Input.is_action_just_released("ui_accept"):
#		Global.boost = false
	
	if Global.boost == true and Global.dialogue_active == false:
		move_and_slide(velocity)
	else:
		topdown_movement(350)
	

#topdown movement
func topdown_movement(speed):
	if Input.is_action_pressed("ui_right") and Input.is_action_pressed("ui_left"):
		velocity.x = lerp(velocity.x,0,speed_change_factor)
	elif Input.is_action_pressed("ui_left"):
		velocity.x = lerp(velocity.x,-speed,1)
	elif Input.is_action_pressed("ui_right"):
		velocity.x = lerp(velocity.x,speed,1)
	else:
		velocity.x = lerp(velocity.x,0,speed_change_factor)
		
		
	if Input.is_action_pressed("ui_up") and Input.is_action_pressed("ui_down"):
		velocity.y = lerp(velocity.y,0,speed_change_factor)
	elif Input.is_action_pressed("ui_up"):
		velocity.y = lerp(velocity.y,-speed,1)
	elif Input.is_action_pressed("ui_down"):
		velocity.y = lerp(velocity.y,speed,1)
	else:
		velocity.y = lerp(velocity.y,0,speed_change_factor)
	if Global.dialogue_active == false:
		velocity = move_and_slide(velocity)


#boost topdown movement
func boost_topdown_movement(boostspeed):
	if Input.is_action_pressed("ui_right") and Input.is_action_pressed("ui_left"):
		velocity.x = lerp(velocity.x,0,speed_change_factor)
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -boostspeed
	elif Input.is_action_pressed("ui_right"):
		velocity.x = boostspeed
	else:
		velocity.x = lerp(velocity.x,0,speed_change_factor)
		
		
	if Input.is_action_pressed("ui_up") and Input.is_action_pressed("ui_down"):
		velocity.y = lerp(velocity.y,0,speed_change_factor)
	elif Input.is_action_pressed("ui_up"):
		velocity.y = -boostspeed
	elif Input.is_action_pressed("ui_down"):
		velocity.y = boostspeed
	else:
		velocity.y = lerp(velocity.y,0,speed_change_factor)


#level increase
func _on_Area2D_body_entered(body):
	Global.Level = 1 + Global.Level
	print(body)


func _on_Trigger_body_entered(body):
	
	Global.Text = "Gasp noise....  a light!"
	print(body)
