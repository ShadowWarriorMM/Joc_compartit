extends AnimatedSprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	$".".play("default")
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Global.monedes == 4 and Global.enemics == 0:
		$RichTextLabel.visible=false

