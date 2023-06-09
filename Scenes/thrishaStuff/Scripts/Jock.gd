extends Area2D

onready var character = $AnimationPlayer

onready var sprite = $body

func _physics_process(_delta):
	character.play("Idle 2 Overworld")

var active = false

func _process(_delta):
	$QuestionMark.visible = active
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func _input(event):
	if get_node_or_null('DialogNode') == null:
		if event.is_action_pressed("interact") and active:
			if(StoryVariables.currentlyInChapterThree and StoryVariables.isJockQuestEnded == false):
				#side quest
				active = false
				pause_game()
				var dialog = Dialogic.start("jock_sideQuest")
				dialog.pause_mode = Node.PAUSE_MODE_PROCESS
				dialog.connect('timeline_end', self, 'unpause')
				add_child(dialog)
				StoryVariables.isJockQuestStarted = true
			if(StoryVariables.currentlyInChapterOne == true):
				#chapter 1 basic dialogue
				active = false
				pause_game()
				var dialog = Dialogic.start("ch1_jock")
				dialog.pause_mode = Node.PAUSE_MODE_PROCESS
				dialog.connect('timeline_end', self, 'unpause')
				add_child(dialog)
			elif(StoryVariables.currentlyInChapterTwo == true):
				#chapter 2 basic dialogue
				active = false
				pause_game()
				var dialog = Dialogic.start("ch2_jock")
				dialog.pause_mode = Node.PAUSE_MODE_PROCESS
				dialog.connect('timeline_end', self, 'unpause')
				add_child(dialog)
			elif(StoryVariables.currentlyInChapterThree == true and StoryVariables.isJockQuestEnded == true):
				#chapter 3 basic dialogue
				active = false
				pause_game()
				var dialog = Dialogic.start("ch3_jock")
				dialog.pause_mode = Node.PAUSE_MODE_PROCESS
				dialog.connect('timeline_end', self, 'unpause')
				add_child(dialog)

func pause_game():
	get_tree().paused = true
	StoryVariables.canPlayerMove = false
	
func unpause(timeline_name):
	get_tree().paused = false
	StoryVariables.canPlayerMove = true
	
	if Dialogic.get_variable('jockHelp') == "0":
		StoryVariables.isJockQuestEnded = true
		StoryVariables.goodPoints += 1
	
func _on_Jock_body_entered(body):
	if body.name == 'player':
		active = true

func _on_Jock_body_exited(body):
	if body.name == 'player':
		active = false
