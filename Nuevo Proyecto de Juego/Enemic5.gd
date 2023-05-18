extends KinematicBody2D

var Velocitat = 50
var Moviment = Vector2.ZERO
var Desplacament = Vector2.ZERO
var Canvia=0
var temps=0
var temps2=0
var ataca=0
var Vides=2
var Comprobador= 0
var Aconseguit=0
var Aconseguit2=0
var Quiet=0
var Una_vegada=0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
# Called every frame. 'delta' is the elapsed time since the previous frame.

func _process(delta):
	if Quiet!=1:
		if temps==0:
			Desplacament= Vector2.ZERO
			Moviment= Vector2.ZERO
			$Temps_moviment.start()
			temps+=1
		if temps==1:
			$"Animació".play("Mou")
			Desplacament= Vector2.RIGHT

		if temps2==1:
			Desplacament= Vector2.ZERO
			Moviment= Vector2.ZERO
			$Temps2.start()
			temps2+=1
		if temps2==2:
			$"Animació".play("Mou")
			Desplacament=Vector2.LEFT

		Moviment+= Desplacament.normalized()*Velocitat*delta
		Canvia_direccio (Moviment)
		if Moviment.x>0:
			$"Llança2/CollisionShape2D".disabled=true
			$"Llança1/CollisionShape2D".disabled=false
		else:
			$"Llança1/CollisionShape2D".disabled=true
			$"Llança2/CollisionShape2D".disabled=false
			
	Moviment= move_and_slide(Moviment)
	if Vides<=0 and Una_vegada==0:
		$"Animació".play("mort")
		$Temps_mort.start()
		Quiet=1
		$"Llança1/CollisionShape2D".disabled=true
		$"Llança2/CollisionShape2D".disabled=true
		Moviment.x=0
		$AudioStreamPlayer2D.play()
		$Timer.start()
		Una_vegada+=1

func Canvia_direccio (Moviment):
	if Moviment.x > 0:
		$"Animació".flip_h=true
	if Moviment.x<0:
		$"Animació".flip_h=false


func _on_Temps_moviment_timeout():
	temps=3
	temps2=1

func _on_Temps2_timeout():
	temps2=3
	temps=0

func _on_Ataca_timeout():
	Desplacament= Vector2.ZERO
	Moviment= Vector2.ZERO
	Comprobador=temps2
	temps=null
	temps2=null
	Canvia_direccio (Moviment)
	
	


func _on_Temps_mort_timeout():
	Global.enemics-=1
	queue_free()


func _on_Llana1_body_entered(body):
	if body==$"../Cavaller" and Input.is_action_pressed("cubrir")!=true:
		body.Vides-=1

func _on_Llana2_body_entered(body):
	if body==$"../Cavaller" and Input.is_action_pressed("cubrir")!=true:
		body.Vides-=1




func _on_Timer_timeout():
	$AudioStreamPlayer2D.stop()
