extends Node2D

var spawning: bool = true 
var defeat : bool = false
var Level : int = 1
var Max_Level : int = 3
var Points : int = 0
var Time_Between : float = 1.5
var my_random_number

var obstacle_1 = preload("res://Objects/Obstacle_1.tscn")
var obstacle_2 = preload("res://Objects/Obstacle_2.tscn")
var obstacle_3 = preload("res://Objects/Obstacle_3.tscn")
var Weight = preload("res://Objects/Weight.tscn")
var obstacle_instance

var rng = RandomNumberGenerator.new()


# Called when the node enters the scene tree for the first time.
func _ready():
	add_child(obstacle_1.instantiate())
	spawn_obstacle()
	pass # Replace with function body.


# Function to spawn obstacles
func spawn_obstacle():
	while spawning:
		await get_tree().create_timer(Time_Between).timeout
		
		rng.randomize()
		var my_random_number = rng.randi_range(0, Level - 1)
		
		Points += 1 
		if Points % 5 == 0:
			if Level < Max_Level:
				Level += 1 
		
		if my_random_number == 0: 
			obstacle_instance = obstacle_1.instantiate()
		elif my_random_number == 1: 
			obstacle_instance = obstacle_2.instantiate()
		elif my_random_number == 2: 
			obstacle_instance = obstacle_3.instantiate()
		elif my_random_number == 3: 
			obstacle_instance = Weight.instantiate()
		
		
		add_child(obstacle_instance)


func _on_dino_defeat():
	queue_free()
	pass # Replace with function body.


func _on_dino_2_defeat():
	queue_free()
	pass # Replace with function body.
