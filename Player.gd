extends KinematicBody2D

var velocidad = 200
var velocity = Vector2.ZERO

func _ready():
	$AnimatedSprite.play("Idle")
	$AnimatedSprite.playing = true
	
	
	
func _process(_delta):
	move()
	velocity = move_and_slide(velocity)
	
func move():
	velocity = Vector2.ZERO
	
	if Input.is_action_pressed('ui_right'):
		velocity.x += 1
	if Input.is_action_pressed('ui_left'):
		velocity.x -= 1
	if Input.is_action_pressed('ui_down'):
		velocity.y += 1
	if Input.is_action_pressed('ui_up'):
		velocity.y -= 1
	
	if velocity.y != 0 or velocity.x != 0:
		$AnimatedSprite.play("Run")
		if velocity.x > 0:
			$AnimatedSprite.flip_h = false
		elif velocity.x < 0:
			$AnimatedSprite.flip_h = true
	elif velocity.y == 0 and velocity.x == 0:
		$AnimatedSprite.play("Idle")
	
	velocity = velocity.normalized() * velocidad
	
	
