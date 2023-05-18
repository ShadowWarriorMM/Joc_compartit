extends Area2D

var cau=0
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if cau==1:
		position.y+=2


func _on_Estalactita_body_entered(body):
	if body.name == "Cavaller":
		body.Vides -= 3
