extends CanvasLayer

onready var t_label = get_node("Time")
onready var t_up = get_node("Time's UP")

export var t_lim = 300
var time
var time_inc = 1
var paused = false #will implement pausing later

func _ready():
	set_process(true)
	time = 0

func _process(delta):
	if t_lim - int(time) >= 0:
		time += delta * time_inc 
		#time is a float so int() dont have gross decimal places
		t_label.text = "Time:  " + str(t_lim - int(time)) + "s"
	
	if t_lim - int(time) <= 0:
		t_label.text = "Time:  " + "0s"
		
		t_up.show() 
		t_up.play()
		t_up.animation = "TIMES UP!"
