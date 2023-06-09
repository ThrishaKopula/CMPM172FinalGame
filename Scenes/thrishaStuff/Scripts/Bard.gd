extends Area2D

onready var character = $AnimationPlayer

onready var sprite = $body

func _physics_process(_delta):
	character.play("Idle 1 Overworld")

var active = false
var doneWithStrings = false

func _process(_delta):
	$QuestionMark.visible = active
	
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func _input(event):
	if get_node_or_null('DialogNode') == null:
		if event.is_action_pressed("interact") and active:
			if(StoryVariables.isChapterOneStartDone == true):
				active = false
				pause_game()
				var dialog = Dialogic.start("initiateMainQuest")
				dialog.pause_mode = Node.PAUSE_MODE_PROCESS
				dialog.connect('timeline_end', self, 'unpause')
				add_child(dialog)
				StoryVariables.isInitiateMainQuestDone = true
				StoryVariables.isChapterOneStartDone = false
				StoryVariables.chapterOneQuest = true
			elif(StoryVariables.isReportBackToMusicGeek == true):
				active = false
				pause_game()
				var dialog = Dialogic.start("deliverStringsToBard")
				dialog.pause_mode = Node.PAUSE_MODE_PROCESS
				dialog.connect('timeline_end', self, 'unpause')
				add_child(dialog)
				StoryVariables.isDeliverStringsToBard = true
				StoryVariables.isReportBackToMusicGeek = false
				doneWithStrings = true
			elif(StoryVariables.isCollectOtherworldlyItems == true):
				active = false
				pause_game()
				var dialog = Dialogic.start("bringIngredientsToTavern")
				dialog.pause_mode = Node.PAUSE_MODE_PROCESS
				dialog.connect('timeline_end', self, 'miniGameUnpause')
				add_child(dialog)
				StoryVariables.isBringIngredientsToTavern = true
				StoryVariables.isCollectOtherworldlyItems = false
				StoryVariables.chapterOneQuest = false
			elif(StoryVariables.currentlyInChapterOne == true and StoryVariables.chapterOneQuest == true and StoryVariables.isChapterOneStartDone == false and StoryVariables.isReportBackToMusicGeek == false and StoryVariables.isCollectOtherworldlyItems == false): 
				#chapter 1 during quest
				active = false
				pause_game()
				var dialog = Dialogic.start("ch1_bardQuest")
				dialog.pause_mode = Node.PAUSE_MODE_PROCESS
				dialog.connect('timeline_end', self, 'unpause')
				add_child(dialog)
			elif(StoryVariables.currentlyInChapterOne == true and StoryVariables.chapterOneQuest == false and StoryVariables.isChapterOneStartDone == false and StoryVariables.isReportBackToMusicGeek == false and StoryVariables.isCollectOtherworldlyItems == false): 
				#chapter 1 after quest
				active = false
				pause_game()
				var dialog = Dialogic.start("ch1_bardNoQuest")
				dialog.pause_mode = Node.PAUSE_MODE_PROCESS
				dialog.connect('timeline_end', self, 'unpause')
				add_child(dialog)
			elif(StoryVariables.currentlyInChapterTwo == true): 
				#chapter 2 basic dialogue
				active = false
				pause_game()
				var dialog = Dialogic.start("ch2_bard")
				dialog.pause_mode = Node.PAUSE_MODE_PROCESS
				dialog.connect('timeline_end', self, 'unpause')
				add_child(dialog)
			elif(StoryVariables.currentlyInChapterThree == true): 
				#chapter 3 basic dialogue
				active = false
				pause_game()
				var dialog = Dialogic.start("ch3_bard")
				dialog.pause_mode = Node.PAUSE_MODE_PROCESS
				dialog.connect('timeline_end', self, 'unpause')
				add_child(dialog)

func pause_game():
	get_tree().paused = true
	StoryVariables.canPlayerMove = false
	
func miniGameUnpause(timeline_name):
	get_tree().paused = false
	StoryVariables.canPlayerMove = true
	active = false
	get_tree().change_scene("res://Scenes/leoStuff/mini_game2/mini_game2.tscn")
	
func unpause(timeline_name):
	get_tree().paused = false
	StoryVariables.canPlayerMove = true

func _on_Bard_body_entered(body):
	if body.name == 'player':
		active = true

func _on_Bard_body_exited(body):
	if body.name == 'player':
		active = false
