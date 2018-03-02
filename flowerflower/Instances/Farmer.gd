extends KinematicBody2D

export var pix_per_sec = 128
const dx = 1
const dy = 1

var player

func _ready():
	player = find_node("Farmer")
	set_physics_process(true)
	
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
	
	
	if velocity.length() > 0:
		$AnimatedSprite.play()
	if velocity == Vector2(0,0):
		$AnimatedSprite.stop()
	if velocity.y > 0:
		$AnimatedSprite.animation = "down"
	if velocity.y < 0:
		$AnimatedSprite.animation = "up"
	if velocity.x > 0:
		$AnimatedSprite.animation = "side"
		$AnimatedSprite.flip_h = false
	if velocity.x < 0:
		$AnimatedSprite.animation = "side"
		$AnimatedSprite.flip_h = true
	
	
	

	
	velocity = velocity.normalized()*pix_per_sec #normalise incase i add diagonal movement later
	move_and_collide(velocity * delta)

