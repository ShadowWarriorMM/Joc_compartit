extends KinematicBody2D

var Desplacament=Vector2.DOWN
var Pujada= Vector2.UP
var Moviment= Vector2.ZERO
var Una_vegada=0
var Posicio= Vector2 (0,0)
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	Posicio= position
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Global.timer==1 and Una_vegada!=1:
		$Timer.start()
		Una_vegada=1
	if $"..".Entrat==1:
		Moviment+=Desplacament*delta*400
	move_and_slide(Moviment)
	

func _on_Area2D_body_entered(body):
	if body.name=="Cavaller":
		if Input.is_action_pressed("cubrir")!=true:
			body.Vides-=3
		

func _on_Timer_timeout():
	queue_free()
	
