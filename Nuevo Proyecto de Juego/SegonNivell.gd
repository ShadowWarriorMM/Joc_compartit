extends TileMap


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	Global.Passat = 1
	Global.Comenca = 1


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D2_body_entered(body):
	if body.name== "Cavaller":
		body.Escala=1
		


func _on_Area2D20_body_entered(body):
	body.Vides-=3


func _on_AudioStreamPlayer2D_finished():
	$AudioStreamPlayer2D.play()
