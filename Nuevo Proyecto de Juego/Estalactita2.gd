extends KinematicBody2D

var Entrat=0
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.y+=1*delta*500


func _on_Area2D_body_entered(body):
	Entrat=1
