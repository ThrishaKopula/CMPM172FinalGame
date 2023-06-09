extends Node2D

var cur_drink;

var time = 120;
var canTimerStart = false
	
func _ready():
	$cheatOn.hide();
	$drink1.get_node("AnimationPlayer").play("cherry idle");
	$drink2.get_node("AnimationPlayer").play("peach idle");
	$drink3.get_node("AnimationPlayer").play("lemon idle");

	$character.get_node("AnimationPlayer").play("Idle 2 Wonderland");

	Mini2Global.nextDrink();
	updateNum();
#	$drink1.get_node("AnimationPlayer").play("cherry pour");
#	$drink2.get_node("AnimationPlayer").play("peach pour");
#	$drink3.get_node("AnimationPlayer").play("lemon pour");

	var dialog = Dialogic.start("BartendingGameRules");
	dialog.connect('timeline_end', self, 'unpauseAfterRules');
	add_child(dialog);

func unpauseAfterRules(timeline_name):
	get_tree().paused = false;
	canTimerStart = true

func _process(delta):
	if ($BartendingAudio.playing == false):
		$BartendingAudio.play()
	
	if(canTimerStart == true):
		if time > 0:
			time -= delta;
			$nums/time.text = String(int(time));
		else:
			$nums/time.text = "0";
			Mini2Global.nextDrink();
			Mini2Global.reset();
			Mini2Global.correct_drink = 0;
			$winLogo/AnimationPlayer.play("lose");
			
			yield($winLogo/AnimationPlayer,"animation_finished");
			
			if StoryVariables.miniGameToMainMenu:
				StoryVariables.miniGameToMainMenu = false;
				Fade.change_scene("res://Scenes/thrishaStuff/MainMenu.tscn");
			else:
				get_tree().reload_current_scene();
	
func updateNum():
	$nums/numCherry.text = String(Mini2Global.win_R);
	$nums/numPeach.text = String(Mini2Global.win_G);
	$nums/numLemon.text = String(Mini2Global.win_B);

func _on_cheat_pressed():
	
	StoryVariables.badPoints += 1;
	
	Mini2Global.cheat = true;
	$cheat.disabled = true;
	$overall.get_node("AnimationPlayer").play("Blue Cookie");
	$cheatOn.show();
	$nums/numCherry.hide();
	$nums/numPeach.hide();
	$nums/numLemon.hide();
	Mini2Global.sending = true;
	
	yield ($overall.get_node("AnimationPlayer"),"animation_finished");
	Mini2Global.sending = false;
	pass # Replace with function body.

func _on_newButt_pressed():
	
	if !Mini2Global.drink_onScene:
		print("clicked");
		var drink = load("res://Scenes/leoStuff/mini_game2/drink.tscn");
		cur_drink = drink.instance();
		add_child(cur_drink);
		cur_drink.position = Vector2(-100,-200);
		Mini2Global.sending = true;
		Mini2Global.drink_onScene = true;
		
		cur_drink.get_node("AnimationPlayer").play("new drink");
		yield(cur_drink.get_node("AnimationPlayer"), "animation_finished");
		
		yield(get_tree().create_timer(.3), "timeout");
		Mini2Global.sending = false;
		
	
	
	pass # Replace with function body.

func _on_drinkButt_pressed():
	
	if Mini2Global.cur_color == 1 and !Mini2Global.sending:
		$pour.play();
		Mini2Global.sending = true;
		$drink1.get_node("AnimationPlayer").play("cherry pour");
		
		yield($drink1.get_node("AnimationPlayer"), "animation_finished");
		$drink1.get_node("AnimationPlayer").play("cherry idle");
		
		yield(get_tree().create_timer(.5), "timeout");
		Mini2Global.sending = false;
		Mini2Global.red_pump = Mini2Global.red_pump + 1;
		

	pass # Replace with function body.

func _on_drinkButt2_pressed():
	if Mini2Global.cur_color == 2 and !Mini2Global.sending:
		$pour.play();
		Mini2Global.sending = true;
		Mini2Global.green_pump = Mini2Global.green_pump + 1;
		$drink2.get_node("AnimationPlayer").play("peach pour");
		
		yield($drink2.get_node("AnimationPlayer"), "animation_finished");
		$drink2.get_node("AnimationPlayer").play("peach idle");
		yield(get_tree().create_timer(.5), "timeout");
		
		Mini2Global.sending = false;
		
	pass # Replace with function body.

func _on_drinkButt3_pressed():
	if Mini2Global.cur_color == 3 and !Mini2Global.sending:
		$pour.play();
		Mini2Global.sending = true;
		Mini2Global.blue_pump = Mini2Global.blue_pump + 1;
		$drink3.get_node("AnimationPlayer").play("lemon pour");
		
		yield($drink3.get_node("AnimationPlayer"), "animation_finished");
		$drink3.get_node("AnimationPlayer").play("lemon idle");
		
		yield(get_tree().create_timer(.5), "timeout")
		Mini2Global.sending = false;
		
	pass # Replace with function body.

func _on_finishButt_pressed():
	
	if Mini2Global.drink_onScene and !Mini2Global.sending:
	
		var animation = cur_drink.get_node("AnimationPlayer");
		animation.get_animation("send").track_set_key_value(0,0,cur_drink.position);
		Mini2Global.sending = true;
		animation.play("send");
		
		yield (animation, "animation_finished");
		
		cur_drink.queue_free();
			
		Mini2Global.sending = false;
		
		Mini2Global.check_win();
		updateNum();
	pass # Replace with function body.

func _on_discardButt_pressed():
	
	if Mini2Global.drink_onScene and !Mini2Global.sending:
		
		var animation = cur_drink.get_node("AnimationPlayer");
		animation.get_animation("delete").track_set_key_value(0,0,cur_drink.position);
		animation.play("delete");
		Mini2Global.sending = true;
		
		yield (animation, "animation_finished");
		
		Mini2Global.sending = false;
		cur_drink.queue_free();
		Mini2Global.reset();
	
	pass # Replace with function body.
