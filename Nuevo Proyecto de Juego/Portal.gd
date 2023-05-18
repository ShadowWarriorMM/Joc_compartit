extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Portal_body_entered(body):
	body.position= Vector2(1627,274)
	$"../Travessa".play()
	$"../Timer".start()




func _on_Timer_timeout():
	$"../Travessa".stop()
