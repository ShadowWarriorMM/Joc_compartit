extends AnimatedSprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
func _on_Area_moneda_body_entered(body):
	$Moneda.play()
	$Timer.start()
	$Timer2.start()
	Global.monedes+= 1
	


func _on_Timer_timeout():
	$Area_moneda/CollisionShape2D.disabled=true
	$".".visible=false




func _on_Timer2_timeout():
	$Moneda.stop()
