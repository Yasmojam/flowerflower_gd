extends KinematicBody2D

export var pix_per_sec = 128
const dx = 1
const dy = 1
const start_pos = Vector2(384,352)

onready var player = find_node("Farmer")
onready var hitbox = find_node("hitbox")

onready var attack = 0 #idle

var velocity = Vector2()

var ORIENTATION = ""
var PLAYERSTATE = ""



func _ready():
	set_physics_process(true)
	
#ATTACK
func _physics_process(delta):
	
	if Input.is_key_pressed(KEY_SPACE):
			attack = 1
			hitbox.set_scale(Vector2(8,5))
			$AnimatedSprite.visible = false
			$Scythe.visible = true
			$Scythe.play()
			$Scythe.animation = "scythe"
	else: 
		attack = 0
		
#MOVEMENT
	var velocity = Vector2(0,0)
	
	if Input.is_key_pressed(KEY_W):
		velocity.y -= dy
		ORIENTATION = "up"
	elif Input.is_key_pressed(KEY_S):
		velocity.y += dy
		ORIENTATION = "down"
	elif Input.is_key_pressed(KEY_A):
		velocity.x -= dx
		ORIENTATION= "left"
	elif Input.is_key_pressed(KEY_D):
		velocity.x += dx
		ORIENTATION = "right"
		
#ANIMATIONS
	if velocity.length() > 0:
		PLAYERSTATE = "moving"
		$AnimatedSprite.play()
	
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
			
#STOPPING ANIMATION
	if velocity == Vector2(0,0):
		PLAYERSTATE = "stationary"
		if ORIENTATION == "down":
			$AnimatedSprite.animation = "rest down"
		if ORIENTATION == "down" and Input.is_key_pressed(KEY_E):
			$AnimatedSprite.animation = "watering down"
			
		elif ORIENTATION == "up":
			$AnimatedSprite.animation = "rest up"
		if ORIENTATION == "up" and Input.is_key_pressed(KEY_E):
			$AnimatedSprite.animation = "watering up"
			
		elif ORIENTATION == "right":
			$AnimatedSprite.animation = "rest side"
			$AnimatedSprite.flip_h = false
		if ORIENTATION == "right" and Input.is_key_pressed(KEY_E):
			$AnimatedSprite.animation = "watering side"
			$AnimatedSprite.flip_h = false
		
		elif ORIENTATION == "left":
			$AnimatedSprite.animation = "rest side"
			$AnimatedSprite.flip_h = true
		if ORIENTATION == "left" and Input.is_key_pressed(KEY_E):
			$AnimatedSprite.animation = "watering side"
			$AnimatedSprite.flip_h = true
		

		
		#MOVE
	velocity = velocity.normalized()*pix_per_sec #normalise incase i add diagonal movement later
	move_and_collide(velocity * delta)







func _on_Scythe_animation_finished():
	attack = 0
	hitbox.set_scale(Vector2(2,2))
	$Scythe.visible = false
	$AnimatedSprite.visible = true
