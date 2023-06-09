extends Area2D


# Declare member variables here. Examples:
# var a = 2
export var can_color : int;


# Called when the node enters the scene tree for the first time.
func _ready():
	
	if Input.is_action_just_released("click"):
		print("delete");
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_can_body_entered(body):
	$"../trash".play();
	if $"..".cheat:
		print("good");
		body.queue_free();
		$"..".trashNum -= 1;
		$"../Tleft".text = String($"..".trashNum);
		
	elif body.get("color") == can_color:
		print("good");
		body.queue_free();
		$"..".trashNum -= 1;
		$"../Tleft".text = String($"..".trashNum);
		
	else:
		$"..".bad_call();
		print("bad");
		body.queue_free();
	
	if $"..".trashNum <= 0:
		$"../winLogo/AnimationPlayer".play("win");
		yield($"../winLogo/AnimationPlayer","animation_finished");
		Mini4Global.win();
	
	pass # Replace with function body.
