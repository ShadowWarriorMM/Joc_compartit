extends Timer

var Una_vegada=0
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if $"../RichTextLabel4".visible==true:
		if Una_vegada!=1:
			$".".start()
			Una_vegada+=1
	if Global.saltat!=0:
		$"../RichTextLabel4".visible=false

func _on_Timer4_timeout():
	$"../RichTextLabel4".visible=false
	$"../RichTextLabel5".visible=true
