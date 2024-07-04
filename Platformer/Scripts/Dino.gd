extends CharacterBody2D

signal Defeat
signal Attack

var jump_power = 700  # Increased jump power
var gravity = 1200  # Increased gravity for faster falling
var jumping : bool = true
var Defeated : bool = false
var Jump_Key = KEY_SPACE

func _ready():
	pass

func _physics_process(delta):
	if Input.is_key_pressed(Jump_Key):
		if not jumping and is_on_floor():
			velocity.y = -jump_power
			jumping = true
	velocity.y += gravity * delta
	move_and_slide()

	if is_on_floor() and jumping:
		jumping = false
	
	if Defeated == true:
		jumping = true

func _on_area_2d_body_entered(body):
	if body.is_in_group("Obstacles"):
		body.queue_free()
		Defeated = true
		modulate.a = 0.5
		emit_signal("Defeat")
	
	if body.is_in_group("Weight"):
		body.queue_free()
		emit_signal("Attack")
	pass
	

func Apply_Weight():
	modulate.b +=40
	jump_power -= 200
	await get_tree().create_timer(3).timeout
	jump_power += 200
	modulate.b -=40


func _on_main_assign_p_2():
	Jump_Key = KEY_ENTER
	pass # Replace with function body.




func _on_attack():
	Apply_Weight()
	pass # Replace with function body.


func _on_dino_2_attack():
	Apply_Weight()
	pass # Replace with function body.
