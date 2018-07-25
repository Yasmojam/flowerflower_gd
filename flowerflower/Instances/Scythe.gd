extends Area2D

enum STATES {IDLE,ATTACK}
var current_state = IDLE
export(int) var damage = 1

#onready var find_node("Scythe").set_position = find_node("Farmer").position

func _ready():
	set_physics_process(false)
	
func attack():
	_change_state(attack)
	#called from the farmer, when she switches to attack state
	pass

func _change_state(new_state):
	current_state = new_state
	#initialise attack/idle state
	match current_state:
		IDLE:
			set_physics_process(false)
		ATTACK: 
			set_physics_process(true)

func _physics_process(delta):
	var overlapping_bodies = get_overlapping_bodies()
	if not overlapping_bodies:
		return
	for body in overlapping_bodies: 
		if not body.is_in_group("enemy"):
			return
		body.take_damage(damage)
		_change_state(IDLE)
	set_physics_process(false) #hit it once a second instead of 60 frames per second
	

	#get colliding boddies
	#check for each body, if its a slug/snail/seed
	#if slug/snail, damage and stop physics for attack
	