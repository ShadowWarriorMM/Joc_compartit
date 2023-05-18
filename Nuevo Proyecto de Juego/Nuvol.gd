extends Area2D

var rota=0
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if rota==1:
		$Sprite.rotation_degrees+=1
		$Area2D/CollisionShape2D.rotation_degrees+=1
		$Area2D/StaticBody2D/CollisionShape2D2.rotation_degrees+=1

