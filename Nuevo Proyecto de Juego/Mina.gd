extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var Una=0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func _on_Area2D11_body_entered(body):
	if body.name== "Cavaller" and Una!=1:
		$AnimatedSprite.visible=true
		$AnimatedSprite.play("foc")
		$AudioStreamPlayer.play()
		body.Vides-=3
		Una+=1

		


