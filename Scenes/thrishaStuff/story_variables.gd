extends Node

var basic = preload("res://Scenes/thrishaStuff/images/speech_bubbles/Speech_Bubble_-2.png")
var basicTalked = preload("res://Scenes/thrishaStuff/images/speech_bubbles/Speech_Bubble_-1.png")
var quest = preload("res://Scenes/thrishaStuff/images/speech_bubbles/Speech_Bubble_-3.png")

var goodPoints = 0
var badPoints = 0

var miniGameToMainMenu = false

# Declare member variables here. Examples:
var canPlayerMove = true
var isLeft = false
var isRight = false

var dormDay = true

var isMapInteracted = false
var isAlisBedInteracted = false
var isOtherBedInteracted = false
var isMirrorInteracted = false
var isAllRoomInteracted = false

# Main game checkpoints
var isPrologueDone = false
var isChapterOneDone = false
var isChapterTwoDone = false
var isChapterThreeDone = false

var currentlyInChapterOne = false
var currentlyInChapterTwo = false
var currentlyInChapterThree = false

var chapterOneQuest = false
var chapterTwoQuest = false
var chapterThreeQuest = false

#CHAPTER ONE
var isChapterOneStartDone = false

#Getting Strings For Bard
var isInitiateMainQuestDone = false
var isSearchForStringsDone = false
var isDeliverLetterToLover = false
var isReportBackToMusicGeek = false
var isDeliverStringsToBard = false

#Trading Vendors
var isGetIngredientsFromVendors = false
var isCollectOtherworldlyItems = false
var isPleb_AItemCollected = false
var isPleb_BItemCollected = false
var isPleb_CItemCollected = false
var isAllItemsCollected = false
var isBringIngredientsToTavern = false
var isGetBallerinaFromBartender = false
var isGiveBallerinaToMatthew = false

#CHAPTER 2
var isChapterTwoStart= false
var isInitiateCh2MainQuest = false
var isFindWhoIsCloseToJanitor = false
var isRetrieveExoticFruit = false
var isCatchTheThief = false
var isBringThiefToVendors = false
var isDeliverExoticFruitToLunchLady = false
var isDeliverToJanitor = false
var isAfterCleaningMinigame = false
var isDeliverKeyToMatthew = false

#CATCH THE THIEF GAME
var isInThiefGame = false
var isInTavern = false
var isInPlebTown = false
var isInAristocratTown = false

var catch_tavern = false
var catch_plebTown = false
var catch_aristocratTown = false
var catch_num = 0
var mini_game1 = false

#CHAPTER 3
var isChapter3Start = false
var isRejectedByJesters = false
var isEavesdropOnJesters = false
var isInitiateRoyalGiftsQuest = false
var isAllRoyalItemsCollected = false
var isDeliverGiftsToJesters = false
var isChapter3Minigame = false
var isTalkToGuards = false
var isTalkToQueen = false

#ROYAL GIFTS QUEST
var heartItem = false
var diamondItem = false
var cloverItem = false
var spadeItem = false

#SIDE QUESTS
var isNerdQuestStarted = false
var isNerdQuestEnded = false

var isMayorQuestStarted = false
var isMayorQuestEnded = false

var isJockQuestStarted = false
var isJockQuestEnded = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func prologue_checkAllInteractions():
	if (isMapInteracted == true && isAlisBedInteracted == true && isOtherBedInteracted == true && isMirrorInteracted == true):
		isAllRoomInteracted = true
		get_tree().paused = false
		Fade.change_scene("res://Scenes/thrishaStuff/Locations/Overworld/Dream.tscn")
		yield(get_tree().create_timer(2), "timeout")
		get_tree().paused = true
		canPlayerMove = false
		var dialog = Dialogic.start("movingInPart2")
		dialog.pause_mode = Node.PAUSE_MODE_PROCESS
		dialog.connect('timeline_end', self, 'unpauseProloguePart3')
		add_child(dialog)
	
func unpauseProloguePart3(timeline_name):
	get_tree().paused = true
	canPlayerMove = false
	var dialog = Dialogic.start("movingInPart3")
	dialog.pause_mode = Node.PAUSE_MODE_PROCESS
	dialog.connect('timeline_end', self, 'unpauseMiniGame1')
	add_child(dialog)

func unpauseMiniGame1(timeline_name):
	get_tree().paused = false
	canPlayerMove = true
	get_tree().change_scene("res://Scenes/leoStuff/mini_game1/mini_game_1.tscn")

func chapter1_checkIfPlebItemsCollected():
	if (isPleb_AItemCollected == true && isPleb_BItemCollected == true && isPleb_CItemCollected == true):
		isAllItemsCollected = true
		get_tree().paused = true
		canPlayerMove = false
		var dialog = Dialogic.start("afterInteracted")
		dialog.pause_mode = Node.PAUSE_MODE_PROCESS
		dialog.connect('timeline_end', self, 'unpause')
		add_child(dialog)

func chapter3_checkJesterItems():
	if (heartItem == true and cloverItem == true and spadeItem == true and diamondItem == true):
		isAllRoyalItemsCollected = true
		get_tree().paused = true
		canPlayerMove = false
		var dialog = Dialogic.start("afterRoyalInteracted")
		dialog.pause_mode = Node.PAUSE_MODE_PROCESS
		dialog.connect('timeline_end', self, 'unpause')
		add_child(dialog)
		
func unpause(timeline_name):
	get_tree().paused = false
	canPlayerMove = true
	
func checkEnding():
	#everytime you cheat in a game, badPoints+1
	#when NPC help is ignored, badPoints+1
	#when NPC is helped, goodPoints+1
	#when player does not cheat in game, goodPoints+1
#	if(isNerdQuestEnded == false):
#		badPoints += 1
#	if(isMayorQuestEnded == false):
#		badPoints += 1
#	if(isJockQuestEnded == false):
#		badPoints += 1

	if(goodPoints >= badPoints):
		get_tree().paused = false
		canPlayerMove = false
		Fade.change_scene("res://Scenes/thrishaStuff/Locations/Overworld/Dream.tscn")
		yield(get_tree().create_timer(2), "timeout")
		get_tree().paused = true
		var dialog = Dialogic.start("goodEnding")
		dialog.pause_mode = Node.PAUSE_MODE_PROCESS
		dialog.connect('timeline_end', self, 'unpauseEnding')
		add_child(dialog)
	else:
		get_tree().paused = false
		canPlayerMove = false
		Fade.change_scene("res://Scenes/thrishaStuff/Locations/Overworld/Dream.tscn")
		yield(get_tree().create_timer(2), "timeout")
		get_tree().paused = true
		var dialog = Dialogic.start("badEnding")
		dialog.pause_mode = Node.PAUSE_MODE_PROCESS
		dialog.connect('timeline_end', self, 'unpauseEnding')
		add_child(dialog)

func unpauseEnding(timeline_name):
	get_tree().paused = false
	canPlayerMove = true
	Fade.change_scene("res://Scenes/thrishaStuff/GameOver.tscn")
	yield(get_tree().create_timer(2), "timeout")

func resetVariables():
	goodPoints = 0
	badPoints = 0
	miniGameToMainMenu = false
	isLeft = false
	isRight = false

	dormDay = true
	isMapInteracted = false
	isAlisBedInteracted = false
	isOtherBedInteracted = false
	isMirrorInteracted = false
	isAllRoomInteracted = false
	isPrologueDone = false
	isChapterOneDone = false
	isChapterTwoDone = false
	isChapterThreeDone = false

	currentlyInChapterOne = false
	currentlyInChapterTwo = false
	currentlyInChapterThree = false

	chapterOneQuest = false
	chapterTwoQuest = false
	chapterThreeQuest = false
	isChapterOneStartDone = false
	isInitiateMainQuestDone = false
	isSearchForStringsDone = false
	isDeliverLetterToLover = false
	isReportBackToMusicGeek = false
	isDeliverStringsToBard = false
	isGetIngredientsFromVendors = false
	isCollectOtherworldlyItems = false
	isPleb_AItemCollected = false
	isPleb_BItemCollected = false
	isPleb_CItemCollected = false
	isAllItemsCollected = false
	isBringIngredientsToTavern = false
	isGetBallerinaFromBartender = false
	isGiveBallerinaToMatthew = false
	isChapterTwoStart= false
	isInitiateCh2MainQuest = false
	isFindWhoIsCloseToJanitor = false
	isRetrieveExoticFruit = false
	isCatchTheThief = false
	isBringThiefToVendors = false
	isDeliverExoticFruitToLunchLady = false
	isDeliverToJanitor = false
	isAfterCleaningMinigame = false
	isDeliverKeyToMatthew = false
	isInThiefGame = false
	isInTavern = false
	isInPlebTown = false
	isInAristocratTown = false

	catch_tavern = false
	catch_plebTown = false
	catch_aristocratTown = false
	catch_num = 0
	mini_game1 = false

#CHAPTER 3
	isChapter3Start = false
	isRejectedByJesters = false
	isEavesdropOnJesters = false
	isInitiateRoyalGiftsQuest = false
	isAllRoyalItemsCollected = false
	isDeliverGiftsToJesters = false
	isChapter3Minigame = false
	isTalkToGuards = false
	isTalkToQueen = false
	heartItem = false
	diamondItem = false
	cloverItem = false
	spadeItem = false
	isNerdQuestStarted = false
	isNerdQuestEnded = false

	isMayorQuestStarted = false
	isMayorQuestEnded = false

	isJockQuestStarted = false
	isJockQuestEnded = false
