extends Node2D

signal Assign_P2 

var player_1_score = 0 
var player_2_score = 0 

var Player_1_Alive : bool = true
var Player_2_Alive : bool = true

var Game_Over : bool  = false



func Update_Score():
	get_node("Label").text = "P1: " + str(player_1_score) + "| P2: " + str(player_2_score)
	pass

func Check_Winner():
	if Player_1_Alive == false and Player_2_Alive == false:
		if player_1_score > player_2_score:
			get_node("Label").text = "P1 WINS !!!"
		elif player_2_score > player_1_score:
			get_node("Label").text = "P2 WINS !!!"
		elif player_1_score == player_2_score:
			get_node("Label").text = "TIE!!!!"	


# Called when the node enters the scene tree for the first time.
func _ready():
	emit_signal("Assign_P2")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_dino_defeat():
	Player_1_Alive = false
	Check_Winner()
	pass

func _on_dino_2_defeat():
	Player_2_Alive = false
	Check_Winner()
	pass # Replace with function body.


func _on_edge_1_destroyed_obstacle():
	if Player_1_Alive == true:
		player_1_score += 1
		Update_Score()
	pass # Replace with function body.


func _on_edge_2_destroyed_obstacle():
	if Player_2_Alive == true:
		player_2_score += 1
		Update_Score()
	pass # Replace with function body.





