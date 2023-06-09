extends Area2D
	
var active = false
	
func _process(_delta):
	$QuestionMark.visible = active

func _input(event):
	if get_node_or_null('DialogNode') == null:
		if event.is_action_pressed("interact") and active:
			if(StoryVariables.isDeliverStringsToBard == true):
				active = false
				pause_game()
				var dialog = Dialogic.start("getIngredientsFromVendors")
				dialog.pause_mode = Node.PAUSE_MODE_PROCESS
				dialog.connect('timeline_end', self, 'unpause')
				add_child(dialog)
				StoryVariables.isDeliverStringsToBard = false
				StoryVariables.isGetIngredientsFromVendors = true
				StoryVariables.chapter1_checkIfPlebItemsCollected()
			elif(StoryVariables.isAllItemsCollected == true):
				active = false
				pause_game()
				var dialog = Dialogic.start("collectOtherworldlyItems")
				dialog.pause_mode = Node.PAUSE_MODE_PROCESS
				dialog.connect('timeline_end', self, 'unpause')
				add_child(dialog)
				StoryVariables.isCollectOtherworldlyItems = true
				StoryVariables.isAllItemsCollected = false
			elif(StoryVariables.isFindWhoIsCloseToJanitor == true):
				active = false
				pause_game()
				var dialog = Dialogic.start("/Chapter 2/retrieveExoticFruit")
				dialog.pause_mode = Node.PAUSE_MODE_PROCESS
				dialog.connect('timeline_end', self, 'unpause')
				add_child(dialog)
				StoryVariables.isRetrieveExoticFruit = true
				StoryVariables.isInThiefGame = true
				StoryVariables.isFindWhoIsCloseToJanitor = false
			elif(StoryVariables.isCatchTheThief == true):
				active = false
				pause_game()
				var dialog = Dialogic.start("/Chapter 2/bringThiefToVendors")
				dialog.pause_mode = Node.PAUSE_MODE_PROCESS
				dialog.connect('timeline_end', self, 'unpause')
				add_child(dialog)
				StoryVariables.isBringThiefToVendors = true
				StoryVariables.isCatchTheThief = false
				StoryVariables.isInThiefGame = false
			elif(StoryVariables.chapterOneQuest == true and StoryVariables.isDeliverStringsToBard == false and StoryVariables.isAllItemsCollected == false):
				#ch1 during quest
				active = false
				pause_game()
				var dialog = Dialogic.start("ch1_plebsQuest")
				dialog.pause_mode = Node.PAUSE_MODE_PROCESS
				dialog.connect('timeline_end', self, 'unpause')
				add_child(dialog)
			elif(StoryVariables.currentlyInChapterOne == true and StoryVariables.chapterOneQuest == false and StoryVariables.isDeliverStringsToBard == false and StoryVariables.isAllItemsCollected == false):
				#ch1 before/after quest
				active = false
				pause_game()
				var dialog = Dialogic.start("ch1_plebsNoQuest")
				dialog.pause_mode = Node.PAUSE_MODE_PROCESS
				dialog.connect('timeline_end', self, 'unpause')
				add_child(dialog)
			elif(StoryVariables.chapterTwoQuest == true and StoryVariables.isFindWhoIsCloseToJanitor == false and StoryVariables.isCatchTheThief == false):
				#ch2 during quest
				active = false
				pause_game()
				var dialog = Dialogic.start("ch2_plebsQuest")
				dialog.pause_mode = Node.PAUSE_MODE_PROCESS
				dialog.connect('timeline_end', self, 'unpause')
				add_child(dialog)
			elif(StoryVariables.currentlyInChapterTwo == true and StoryVariables.chapterTwoQuest == false and StoryVariables.isFindWhoIsCloseToJanitor == false and StoryVariables.isCatchTheThief == false):
				#ch2 before/after quest
				active = false
				pause_game()
				var dialog = Dialogic.start("ch2_plebsNoQuest")
				dialog.pause_mode = Node.PAUSE_MODE_PROCESS
				dialog.connect('timeline_end', self, 'unpause')
				add_child(dialog)
			elif(StoryVariables.currentlyInChapterThree == true):
				#ch3 basic
				active = false
				pause_game()
				var dialog = Dialogic.start("ch3_plebs")
				dialog.pause_mode = Node.PAUSE_MODE_PROCESS
				dialog.connect('timeline_end', self, 'unpause')
				add_child(dialog)
				
func pause_game():
	get_tree().paused = true
	StoryVariables.canPlayerMove = false
	
func unpause(timeline_name):
	get_tree().paused = false
	StoryVariables.canPlayerMove = true

func _on_Plebs_body_entered(body):
	if body.name == 'player':
		active = true

func _on_Plebs_body_exited(body):
	if body.name == 'player':
		active = false
