extends CharacterBody2D

var speed = 200

func _ready():
	velocity.x = -speed

func _physics_process(delta):
	move_and_slide()
