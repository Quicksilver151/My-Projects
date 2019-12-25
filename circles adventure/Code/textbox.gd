extends RichTextLabel

#variables
var seconds = 0
var delta1 = 0
var characters = 0
var charectersvis = 0
var timetillasecond = 10
var charecterporgress = true

#init
func _ready():
	pass

#everyframe
# warning-ignore:unused_argument
func _physics_process(delta):
	#number of charecters
	characters = get_total_character_count()
	
	
	#allows text change
	if Global.Text != text:
		Global.TextUpdateRequested = true
	
	
	#changes text
	if Global.TextUpdateRequested == true and text !=Global.Text:
		charecterporgress = true
		print("okkkkkkk        ",charecterporgress)
		text = Global.Text
	
	#text appering animation + initsutff
	if Global.TextUpdateRequested == true:
		visible_characters = charectersvis
	
	
	#timestuff
	if charecterporgress == true:
		delta1 = delta1+1
		if delta1 == timetillasecond:
			seconds = seconds+1
			delta1 = 0
	charectersvis = seconds
	
	print(seconds,"seconds  ",delta1,"delta1   ",characters,"chars  ",charectersvis,"charvis")