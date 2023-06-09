extends Control

var canAudioPlay = true
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func checkAudio():
	if(canAudioPlay == true):
		$MenuAudio.play()
	else:
		$MenuAudio.stop()
		$MenuAudio.playing == false
		
func _on_StartButton_pressed():
	canAudioPlay = false
	checkAudio()
	var dialog = Dialogic.start("testing")
	add_child(dialog)
	yield(dialog, 'timeline_end')
	get_tree().change_scene("res://Scenes/thrishaStuff/Locations/Overworld/Dorm.tscn")

func _on_Quit_pressed():
	get_tree().quit()

func _on_Credits_pressed():
	pass # Replace with function body.

func _on_StartButton_button_down():
	$ButtonClick.play()

func _on_Options_button_down():
	$ButtonClick.play()

func _on_Quit_button_down():
	$ButtonClick.play()

func _on_Credits_button_down():
	$ButtonClick.play()
	
func _on_Prologue_pressed():
	$prologue/Prologue.disabled = true
	canAudioPlay = false
	checkAudio()
	var dialog = Dialogic.start("movingIn")
	add_child(dialog)
	yield(dialog, 'timeline_end')
	get_tree().change_scene("res://Scenes/thrishaStuff/Locations/Overworld/Dorm.tscn")

func _on_Prologue_button_down():
	$ButtonClick.play()

func _on_Prologue_mouse_entered():
	$prologue.scale = Vector2(1.1, 1.1)

func _on_Prologue_mouse_exited():
	$prologue.scale = Vector2(1, 1)

func _on_Chapter_1_pressed():
	$"chapter1/Chapter 1".disabled = true
	canAudioPlay = false
	checkAudio()
	var dialog = Dialogic.start("chapter1Start")
	add_child(dialog)
	yield(dialog, 'timeline_end')
	StoryVariables.isChapterOneStartDone = true
	StoryVariables.currentlyInChapterOne = true
	get_tree().change_scene("res://Scenes/thrishaStuff/Locations/Overworld/Classroom.tscn")

func _on_Chapter_1_button_down():
	$ButtonClick.play()

func _on_Chapter_1_mouse_entered():
	$chapter1.scale = Vector2(1.1, 1.1)

func _on_Chapter_1_mouse_exited():
	$chapter1.scale = Vector2(1, 1)

func _on_Chapter_2_pressed():
	$"chapter2/Chapter 2".disabled = true
	canAudioPlay = false
	checkAudio()
	var dialog = Dialogic.start("chapter2Start")
	add_child(dialog)
	yield(dialog, 'timeline_end')
	StoryVariables.isChapterTwoStart = true
	StoryVariables.currentlyInChapterTwo = true
	get_tree().change_scene("res://Scenes/thrishaStuff/Locations/Overworld/Classroom.tscn")
	
func _on_Chapter_2_button_down():
	$ButtonClick.play()

func _on_Chapter_3_button_down():
	$ButtonClick.play()

func _on_Chapter_3_pressed():
	$"chapter3/Chapter 3".disabled = true
	canAudioPlay = false
	checkAudio()
	var dialog = Dialogic.start("chapter3Start")
	add_child(dialog)
	yield(dialog, 'timeline_end')
	StoryVariables.isChapter3Start = true
	StoryVariables.currentlyInChapterThree = true
	get_tree().change_scene("res://Scenes/thrishaStuff/Locations/Overworld/Classroom.tscn")

func _on_Chapter_2_mouse_entered():
	$chapter2.scale = Vector2(1.1, 1.1)

func _on_Chapter_2_mouse_exited():
	$chapter2.scale = Vector2(1, 1)

func _on_Chapter_3_mouse_entered():
	$chapter3.scale = Vector2(1.1, 1.1)

func _on_Chapter_3_mouse_exited():
	$chapter3.scale = Vector2(1, 1)

func _on_teaParty_button_down():
	$ButtonClick.play()

func _on_teaParty_pressed():
	canAudioPlay = false
	StoryVariables.miniGameToMainMenu = true;
	checkAudio()
	Fade.change_scene("res://Scenes/leoStuff/mini_game1/mini_game_1.tscn")
	yield(get_tree().create_timer(2), "timeout")
	
func _on_teaParty_mouse_entered():
	$teaParty.scale = Vector2(1.1, 1.1)

func _on_teaParty_mouse_exited():
	$teaParty.scale = Vector2(1, 1)

func _on_bartendingButton_button_down():
	$ButtonClick.play()

func _on_bartendingButton_pressed():
	
	StoryVariables.miniGameToMainMenu = true;
	canAudioPlay = false
	checkAudio()
	Fade.change_scene("res://Scenes/leoStuff/mini_game2/mini_game2.tscn")
	yield(get_tree().create_timer(2), "timeout")
	
func _on_bartendingButton_mouse_entered():
	$bartending.scale = Vector2(1.1, 1.1)
	
func _on_bartendingButton_mouse_exited():
	$bartending.scale = Vector2(1, 1)

func _on_cleaningButton_button_down():
	$ButtonClick.play()

func _on_cleaningButton_pressed():
	StoryVariables.miniGameToMainMenu = true;
	canAudioPlay = false
	checkAudio()
	Fade.change_scene("res://Scenes/leoStuff/mini_game4/mini_game4.tscn")
	yield(get_tree().create_timer(2), "timeout")

func _on_cleaningButton_mouse_entered():
	$cleaning.scale = Vector2(1.1, 1.1)

func _on_cleaningButton_mouse_exited():
	$cleaning.scale = Vector2(1, 1)

func _on_cardMatchButton_button_down():
	$ButtonClick.play()

func _on_cardMatchButton_pressed():
	
	StoryVariables.miniGameToMainMenu = true;
	canAudioPlay = false
	checkAudio()
	Fade.change_scene("res://Scenes/leoStuff/mini_game3/mini_game3.tscn")
	yield(get_tree().create_timer(2), "timeout")

func _on_cardMatchButton_mouse_entered():
	$cardMatch.scale = Vector2(1.1, 1.1)

func _on_cardMatchButton_mouse_exited():
	$cardMatch.scale = Vector2(1, 1)

func _on_Quit_mouse_entered():
	$quit.scale = Vector2(1.1, 1.1)

func _on_Quit_mouse_exited():
	$quit.scale = Vector2(1, 1)

func _on_controlsButton_button_down():
	$ButtonClick.play()

func _on_controlsButton_pressed():
	get_tree().change_scene("res://Scenes/thrishaStuff/Controls.tscn")

func _on_controlsButton_mouse_entered():
	$controls.scale = Vector2(1.1, 1.1)

func _on_controlsButton_mouse_exited():
	$controls.scale = Vector2(1, 1)

func _on_creditsButton_pressed():
	get_tree().change_scene("res://Scenes/thrishaStuff/Credits.tscn")

func _on_creditsButton_button_down():
	$ButtonClick.play()

func _on_creditsButton_mouse_entered():
	$credits.scale = Vector2(1.1, 1.1)

func _on_creditsButton_mouse_exited():
	$credits.scale = Vector2(1, 1)


func _on_rouletteButton_pressed():
	StoryVariables.miniGameToMainMenu = true;
	Fade.change_scene("res://Scenes/leoStuff/mini_game5/mini_game5.tscn")
	yield(get_tree().create_timer(2), "timeout")
	pass # Replace with function body.

func _on_rouletteButton_button_down():
	$ButtonClick.play()
	pass # Replace with function body.

func _on_rouletteButton_mouse_entered():
	$roulette.scale = Vector2(1.1, 1.1)
	pass # Replace with function body.

func _on_rouletteButton_mouse_exited():
	$roulette.scale = Vector2(1, 1)
	pass # Replace with function body.

func _on_discordButton_button_down():
	$ButtonClick.play()

func _on_discordButton_pressed():
	get_tree().change_scene("res://Scenes/thrishaStuff/Discord.tscn")

func _on_discordButton_mouse_entered():
	$discord.scale = Vector2(1.1, 1.1)

func _on_discordButton_mouse_exited():
	$discord.scale = Vector2(1, 1)

func _on_titleScreenButton_button_down():
	$ButtonClick.play()

func _on_titleScreenButton_pressed():
	Fade.change_scene("res://Scenes/thrishaStuff/TitleScreen.tscn")

func _on_titleScreenButton_mouse_entered():
	$titleScreen.scale = Vector2(1.1, 1.1)

func _on_titleScreenButton_mouse_exited():
	$titleScreen.scale = Vector2(1, 1)
