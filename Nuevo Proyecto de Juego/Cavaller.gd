extends KinematicBody2D
onready var cavaller =$"."
var Velocitat = 150
var Gravetat = Vector2.DOWN*500
var Moviment = Vector2.ZERO
var Desplacament = Vector2.ZERO
var salt = 240
var Vides=3
var Mort=0
var Una_vegada=0
var Cobert=0
var Una_vegada3=0
var Escala=0
var Fletxa_carrega= preload ("res://Fletxa_link.tscn")
var Explota = 0
var Cooldown=0

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$"../AudioStreamPlayer2D".play()
			
		


func _process(delta):
	if Global.Passat==1:
		$"../AudioStreamPlayer2D".stop()
	if Global.Comenca==1:
		$Camera1.current=true
		if Global.Passat==1:
			$Camera1.zoom= Vector2(0.4,0.4)
			$"Animació".position=Vector2(-26,-13)
			$Hitbox.position= Vector2(-61,19)
			$CollisionShape2D.position=Vector2(-10,3)
			$Espasa_esquerra.position= Vector2(-15,3)
			$Espasa_dreta.position= Vector2(21,9)
			if Una_vegada3==0:
				$Camera1.position.y+=60
				Una_vegada3+=1
		Global.posicio= position
		Moviment.x=0
		if Mort!=1:				
			if Input.is_action_pressed("cubrir") and is_on_floor():
				if Una_vegada!=1:
					$"Animació".play("Cubreix")
					Moviment= Vector2.ZERO
					Cobert=1
					Una_vegada=1
			if Input.is_action_just_released("cubrir"):
				Cobert=0
				Una_vegada=0
				
			if Cobert!=1:
				if Input.is_action_pressed("dreta"):
					Desplacament+= Vector2.RIGHT
					if Input.is_action_pressed("Ataca")==false:
						$"Animació".play("Camina")
					
				if Input.is_action_pressed("esquerra"):
					Desplacament+= Vector2.LEFT
					$"Animació".play("Camina")
				
				if Input.is_action_pressed("Dispara") and Global.Passat==1 and is_on_floor():
					$"Animació".play("Dispara")
					Moviment= Vector2.ZERO
				
				if Input.is_action_just_released("esquerra") or Input.is_action_just_released("dreta") and Input.is_action_pressed("cubrir")==false :
					Desplacament.x=0
					$"Animació".stop()
					if Input.is_action_pressed("salt")==false and Input.is_action_pressed("cubrir")==false:
						$"Animació".play("Idle ")
				
				
				if Input.is_action_pressed("salt") and is_on_floor() and Escala==0:
					Moviment.y=-salt
					$"Animació".play("Salta")
				if Input.is_action_just_released("salt") and Input.is_action_pressed("cubrir")==false:
					$"Animació".play("Idle ")
				if Input.is_action_pressed("salt") and Escala==1:
					position.y-=4
				if Input.is_action_pressed("Baixa") and Escala==1:
					position.y+=4
					
				if Escala==0 and Input.is_action_pressed("Baixa")==false and Input.is_action_just_released("salt")==false:
					Moviment+=Gravetat*delta
				Moviment+= Desplacament.normalized()*Velocitat
				Canvia_direccio (Moviment)
				Moviment=move_and_slide(Moviment,Vector2.UP)

				if Input.is_action_just_pressed("Ataca"):
					var Una_vegada2=0
					$"Animació".play("Ataca")
					if Una_vegada2==0:
						$AudioStreamPlayer2D.play()
						$Timer8.start()
						Una_vegada2=1
					if $"Animació".flip_h==true:
						$"Espasa_dreta/Espasa_dreta_colisió".disabled=true
						$"Espasa_esquerra/Espasa_esquerra_colisió".disabled=false
					if $"Animació".flip_h==false:
						$"Espasa_esquerra/Espasa_esquerra_colisió".disabled=true
						$"Espasa_dreta/Espasa_dreta_colisió".disabled=false
			if Vides<=0:
				$"Animació".play("Mor")
				$"Duració_mort".start()
				Mort=1
		
func _on_Animaci_animation_finished():
	$"Espasa_esquerra/Espasa_esquerra_colisió".disabled=true
	$"Espasa_dreta/Espasa_dreta_colisió".disabled=true
	if ($"Animació".animation)=="Dispara" and Cooldown==0:			
		var Fletxa= Fletxa_carrega.instance()
		get_parent().call_deferred("add_child", Fletxa)
		Fletxa.position=self.position
		Fletxa.look_at(get_global_mouse_position())
		$"Cooldown fletxa".start()
		Cooldown=1
	
	
	
func Canvia_direccio (Moviment):
	if Moviment.x < 0:
		$"Animació".flip_h=true
	if Moviment.x>0:
		$"Animació".flip_h=false
	


func _on_Duraci_mort_timeout():
	Global.enemics=6
	Global.monedes=0
	Global.timer=0
	Global.timer2=0
	Global.saltat=0
	get_tree().reload_current_scene()
	

func _on_Espasa_dreta_body_entered(body):
	if body == $"../Enemic" or  body == $"../Enemic2" or  body == $"../Enemic3" or body == $"../Enemic4" or body == $"../Enemic6" or  body ==$"../Enemic5":
		body.Vides -= 1
		$AudioStreamPlayer2D2.play()
		$Timer7.start()

func _on_Espasa_esquerra_body_entered(body):
	if body == $"../Enemic" or  body == $"../Enemic2" or  body == $"../Enemic3" or body == $"../Enemic4" or body == $"../Enemic6" or  body ==$"../Enemic5":
		body.Vides -=1
		$AudioStreamPlayer2D2.play()
		$Timer7.start()
			
			
	


func _on_Hitbox_body_entered(body):
	if body.name=="Fletxa" and Input.is_action_pressed("cubrir")==false:
		body.queue_free()
		Vides-=3
	
		
		
	






func _on_Timer7_timeout():
	$AudioStreamPlayer2D2.stop()


func _on_Timer8_timeout():
	$AudioStreamPlayer2D.stop()


func _on_Area2D11_body_entered(body):
	$"../Area2D11/AnimatedSprite".play("explosio")
	$"../Area2D11/Timer".start()


func _on_Timer_timeout():
	$"../Area2D11/Area2D/AnimatedSprite".play("foc")
	Explota=1


func _on_Area2D_body_entered(body):
	if body.name=="Cavaller" and Explota==1:
		Vides-=3


func _on_Cooldown_fletxa_timeout():
	Cooldown=0


func _on_Area2D4_body_exited(body):
	if body.name =="Cavaller":
		body.Escala=0


func _on_Area2D2_body_exited(body):
	if body.name =="Cavaller":
		body.Escala=0


func _on_Area2D3_body_exited(body):
	if body.name =="Cavaller":
		body.Escala=0
