extends KinematicBody2D

export var pix_per_sec = 128
const dx = 1
const dy = 1

var slug
var velocity = Vector2()

func _ready():
	set_physics_process(true)
	slug = find_node("Slug")
	
func _physics_process(delta):
	$AnimatedSprite.play()
	$AnimatedSprite.animation = "Slug"
	velocity.x += dx
	velocity = velocity.normalized()*pix_per_sec #normalise incase i add diagonal movement later
	move_and_collide(velocity * delta)