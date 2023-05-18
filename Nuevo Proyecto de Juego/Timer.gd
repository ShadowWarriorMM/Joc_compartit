extends Timer

var Una_vegada=0
var Temps=0
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if $"..".position.x>273 and Temps!=1:
		$"../RichTextLabel2".visible=true
		if Una_vegada!=1:
			$".".start()
			Una_vegada+=1
	if Input.is_action_just_pressed("cubrir"):
		Global.saltat=1
		
	if Global.saltat!=0:
		$"../RichTextLabel2".visible=false
		$".".stop()
func _on_Timer_timeout():
	Temps=1
	$"../RichTextLabel2".visible=false
	$"../RichTextLabel".visible=true
	
	
