extends Node

var presionat=0
var monedes = 0
#Han de ser 0
var saltat=0 
var posicio=Vector2.ZERO
var Immortal= 0
var timer2=0
var timer=0
var Passat=0
var enemics=5
var Comenca=0
var Vegada=0
var pos=Vector2.ZERO
#Han de ser 6
func _process(delta):
	if Input.is_action_pressed("cubrir"):
		presionat=1
	if Passat==1 and Vegada!=1:
		monedes==0
		enemics=4
		Vegada=1
		
