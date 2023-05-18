extends KinematicBody2D

var Desplacament = Vector2.ZERO
var Gravetat= Vector2(0,500)
var Moviment= Vector2.ZERO
var Velocitat=Vector2(25,0)
var Rota=0

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var posicio_mouse = get_global_mouse_position()
	look_at(posicio_mouse)
	Velocitat = global_position.direction_to(posicio_mouse) * 400
	$"../Timer".start()


func _process(delta):
	Velocitat = Velocitat + Gravetat * delta
	$AnimatedSprite.rotation = Velocitat.angle()
	if Velocitat.x<0:
		$AnimatedSprite.flip_h
	move_and_slide(Velocitat)


func _on_Timer_timeout():
	Rota=1



func _on_Area2D_body_entered(body):
	if body.name=="SegonNivell":
		queue_free()
