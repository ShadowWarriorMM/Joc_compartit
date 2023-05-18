extends AnimatedSprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _process(delta):
	if $"..".Vides<3:
		$".".play("Perd_vida")
	if $"..".position==Vector2(-12,503):
		$".".play("Normal")
	

