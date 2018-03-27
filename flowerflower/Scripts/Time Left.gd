extends RichTextLabel

export var t_lim = 300 
var time
var time_inc = 1
var paused = false #will implement pausing later

func _ready():
	set_process(true)
	time = 0

func _process(delta):
	time += delta * time_inc 
	#time is a float so int() dont have gross decimal places
	text = "Time  " + str(t_lim - int(time)) + "s"
	