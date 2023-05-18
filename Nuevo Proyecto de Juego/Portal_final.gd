extends AnimatedSprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


func _process(delta):
	if Global.monedes==5 and Global.enemics<=0:
		$".".play("default")
		
func _on_Area2D_body_entered(body):
	if body.name== "Cavaller" and Global.monedes==5 and Global.enemics<=0:
		body.position= Vector2 (32,1902)
		body.scale = Vector2 (2,2)
		Global.Passat+=1
		get_tree().change_scene("res://SegonNivell.tscn")
	else:
		pass
