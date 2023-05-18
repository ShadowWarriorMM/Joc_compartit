extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _process(delta):
	pass



func _on_Area2D2_body_entered(body):
	if body.name =="Cavaller":
		body.Escala=1


