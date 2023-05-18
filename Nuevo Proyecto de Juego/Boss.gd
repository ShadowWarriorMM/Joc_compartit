extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var Una_vegada=0
var Bola_carrega= preload ("res://Bola.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.start()
	Una_vegada=1

func _process(delta):
	if Una_vegada==1:
		position.x+=1



func _on_Timer_timeout():
	Una_vegada=0
	$AnimatedSprite.play("Atacar")


func _on_AnimatedSprite_animation_finished():
	var Bola= Bola_carrega.instance()
	get_parent().call_deferred("add_child", Bola)
	Bola.position=self.position
	Global.pos=$"../Cavaller".position
