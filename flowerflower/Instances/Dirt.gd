extends RigidBody2D

const farmer_scene = preload("res://Instances/Farmer.tscn")

onready var seed_sprout = get_node("Seed to Sprout")
onready var sprout_bud = get_node("Sprout to Bud")
onready var bud_flower = get_node("Bud to Flower")



var PLANTSTAGE = 0
#stage 0 = dirt
#stage 1 = seed
#stage 2 = sprouting
#stage 3 = budding
#stage 4 = flowered

func _ready():
	set_process_input(true)
	
func _on_Dirt_input_event(viewport, event, shape_idx): #allows for dirt to be clicked in collision box
	if event is InputEventMouseButton and event.is_pressed() and PLANTSTAGE < 1:
		$AnimatedSprite.play()
		
		$AnimatedSprite.animation = "Seeds"
		PLANTSTAGE = 1
		
		#if Farmer extends Dirt and Input.is_key_pressed(KEY_E):
		seed_sprout.start()


func _on_Seed_to_Sprout_timeout():
	$AnimatedSprite.animation = "Sprouting"
	PLANTSTAGE = 2
	sprout_bud.start()


func _on_Sprout_to_Bud_timeout():
	$AnimatedSprite.animation = "Budding"
	PLANTSTAGE = 3
	bud_flower.start()
	

func _on_Bud_to_Flower_timeout():
	$AnimatedSprite.animation = "Flower"
	PLANTSTAGE = 4