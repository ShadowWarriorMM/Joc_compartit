extends Node2D
var Entrat=0

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var Roca1= preload ("res://Roca.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Entrat==1:
		var Roca= Roca1.instance()
		get_parent().set_deferred("add_child", Roca)
		Roca.position=self.position

func _on_Area2D_body_entered(body):
	if body.name== "Cavaller" and Global.timer2!=1:
		Global.timer2=1
		Entrat=1
		
