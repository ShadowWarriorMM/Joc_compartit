extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	look_at(Global.posicio)


func _on_Cooldown_timeout():
	pass # Replace with function body.
