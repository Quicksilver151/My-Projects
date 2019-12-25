extends Node

var text1 = "hello this is the first text"
var text2 = "short text"
var text3 = "this in an extremely long piece of text that could potentially go beyond the limit just... maybe oh my god that was so cloooooose!!!!!!!!!!!!1"
var text4 = "!@$4123h;[ht[[;;lptb;6799_+(_*_143`$%Y\vfbc"
var text5 = "one day..... i ded"

var all_text = ["",text1,text2,text3,text4,text5]
var num_of_text = all_text.size()-1

#func _process(delta):
#	print(num_of_text)

func dialogue(num):
	Global.Text = all_text[num]
