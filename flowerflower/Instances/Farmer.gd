extends KinematicBody2D

const pix_per_sec = 128
const dx = 3
const dy = 3

var player

func _ready():
	player = find_node("Farmer")
	set_physics_process(true)
	pass
	
func _physics_process(delta):
	var velocity = Vector2(0,0)
	
	if Input.is_key_pressed(KEY_W):
		velocity.y -= dy
	elif Input.is_key_pressed(KEY_S):
		velocity.y += dy
	elif Input.is_key_pressed(KEY_A):
		velocity.x -= dx
	elif Input.is_key_pressed(KEY_D):
		velocity.x += dx
	else: 
		velocity.y = 0 
	velocity = velocity.normalized()*pix_per_sec*delta
	move_and_collide(velocity)

