extends Area2D

onready var character = $AnimationPlayer

onready var sprite = $body

func _physics_process(_delta):
	character.play("Idle 2 Overworld")

var active = false
var interactedCh1 = false
var interactedCh2 = false
var interactedCh3 = false

func _process(_delta):
	$QuestionMark.visible = active

func _input(event):
	if get_node_or_null('DialogNode') == null:
		if event.is_action_pressed("interact") and active:
			if(StoryVariables.currentlyInChapterOne == true):
				#chapter 1 basic dialogue
				interactedCh1 = true
				pause_game()
				var dialog = Dialogic.start("ch1_thief")
				dialog.pause_mode = Node.PAUSE_MODE_PROCESS
				dialog.connect('timeline_end', self, 'unpause')
				add_child(dialog)
			if(StoryVariables.currentlyInChapterTwo == true):
				#chapter 2 basic dialogue
				interactedCh2 = true
				pause_game()
				var dialog = Dialogic.start("ch2_thief")
				dialog.pause_mode = Node.PAUSE_MODE_PROCESS
				dialog.connect('timeline_end', self, 'unpause')
				add_child(dialog)
			if(StoryVariables.currentlyInChapterThree == true):
				#chapter 3 basic dialogue
				interactedCh3 = true
				pause_game()
				var dialog = Dialogic.start("ch3_thief")
				dialog.pause_mode = Node.PAUSE_MODE_PROCESS
				dialog.connect('timeline_end', self, 'unpause')
				add_child(dialog)

func pause_game():
	get_tree().paused = true
	StoryVariables.canPlayerMove = false
	
func unpause(timeline_name):
	get_tree().paused = false
	StoryVariables.canPlayerMove = true
	active = false

func _on_RealThief_body_entered(body):
	if body.name == 'player' and StoryVariables.isInThiefGame == false:
		active = true


func _on_RealThief_body_exited(body):
	if body.name == 'player':
		active = false
