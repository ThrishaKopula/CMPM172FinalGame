extends KinematicBody2D

var motion = Vector2()

export var speed = 100


func _ready():
	print(ControllerLeo.testingvar)
	pass

func _physics_process(delta):
	motion = move_and_slide(motion)
	pass

func _process(delta):
	
	if Input.is_action_pressed("move_right"):
		$Sprite.flip_h = false
		$AnimationPlayer.play("run")
		motion.x = speed
	elif Input.is_action_pressed("move_left"):
		$Sprite.flip_h = true
		$AnimationPlayer.play("run")
		motion.x = -speed
	else:
		$AnimationPlayer.play("idle")
		motion.x = 0
	pass