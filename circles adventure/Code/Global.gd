extends Node

# Variables
var dialogue = ""
var Text = ""
var time_till_loop = 5
var current_level = -2
var dialogue_length = dialogue.length()
var clock = 0
var clocking_allowed = true
var clockmini = 0
var outputtextvisible = 0
var dialogue_active = false
var box_visible = true
var Level = -2

var boost = false

#debug vars
var dialogue_num = 0
var debug = true


#init
#====
func _ready():
	pass


#Repeater
#========
func _physics_process(delta):
	#scene changing
	#=============
	if Global.Level != current_level:
		current_level = Global.Level
		print(current_level)
		get_tree().change_scene("res://Scenes/Level "+str(current_level)+".tscn")
	
	
	#DEBUG STUFF
	#===========
	#===========
	if debug == true:
		#level
		if Input.is_action_just_pressed("debug_level_up"):
			Level = Level+1
		elif Input.is_action_just_pressed("debug_level_down"):
			Level = Level-1
		
		
		#Dialogue
		if Input.is_action_just_pressed("debug_text_next"):
			if dialogue_num < Dialoguesmpls.num_of_text:
				dialogue_num = dialogue_num+1
				Dialoguesmpls.dialogue(dialogue_num)
		if Input.is_action_just_pressed("debug_text_previous"):
			if dialogue_num >= 0:
				dialogue_num = dialogue_num-1
				Dialoguesmpls.dialogue(dialogue_num)
	

#functions
#=========
func texttyping(textinbrac):

	# Time management
	if clocking_allowed == true:
		clockmini = clockmini +1
		if clockmini == time_till_loop:
			clock = clock + 1
			clockmini = 0
	
	# Dialogue start
	if dialogue != Text:
		clock = 0
		dialogue_active = true
		dialogue = Text
		clocking_allowed = true
		box_visible = true
	
	
	#setting visiblility
	outputtextvisible = clock
	
	#completion
	if clocking_allowed == true and Input.is_action_just_pressed("ui_accept"):
		clock = dialogue_length - 1
	if clocking_allowed == false and Input.is_action_just_pressed("ui_accept"):
		clock = 0
		dialogue_active = false
	
	#setting length
	if dialogue_active == true:
		dialogue_length = dialogue.length()
	
	#Dialogue end
	if clock == dialogue_length:
		clocking_allowed = false
