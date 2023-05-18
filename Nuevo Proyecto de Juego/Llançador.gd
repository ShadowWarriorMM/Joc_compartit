extends KinematicBody2D

var Un_cop=0
var Entrat=0
var rotacio=0
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var Fletxa_carrega= preload ("res://Fletxa.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Entrat==1 and Un_cop==0:
		$AnimatedSprite.frame=0
		$AnimatedSprite.play("default")
		Un_cop+=1
	
func _on_AnimatedSprite_animation_finished():
	$Cooldown.start()
	$AnimatedSprite.stop()
	var Fletxa= Fletxa_carrega.instance()
	get_parent().call_deferred("add_child", Fletxa)
	Fletxa.position=self.position
	Fletxa.rotate ($Node2D.rotation)
	
func _on_Cooldown_timeout():
	Un_cop=0
	
func _on_Vista_body_entered(body):
	if body.name== "Cavaller":
		Entrat=1


func _on_Vista_body_exited(body):
	if body.name== "Cavaller":
		Un_cop=0
		Entrat=0
	else:
		body.queue_free()
	


