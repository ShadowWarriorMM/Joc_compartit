extends KinematicBody2D

var Velocitat= Vector2.DOWN

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$Area2D/AnimatedSprite.play("default")
	var pos = Global.pos
	Velocitat = global_position.direction_to(pos) * 10



func _process(delta):
	move_and_slide(Velocitat)



func _on_Area2D_body_entered(body):
	if body.name=="Cavaller":
		body.Vides-=1
	else: 
		queue_free()
