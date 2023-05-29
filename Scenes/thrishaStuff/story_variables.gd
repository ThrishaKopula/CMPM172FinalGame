extends Node

# Declare member variables here. Examples:
var canPlayerMove = true
var isLeft = false
var isRight = false

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
var isAfterCleaningMinigame = true
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

# Called when the node enters the scene tree for the first time.
func _ready():
	connect("my_signal", self, "signal_handler")
	pass # Replace with function body.

func prologue_checkAllInteractions():
	if (isMapInteracted == true && isAlisBedInteracted == true && isOtherBedInteracted == true && isMirrorInteracted == true):
		isAllRoomInteracted = true
		get_tree().paused = true
		canPlayerMove = false
		var dialog = Dialogic.start("movingInPart2")
		dialog.pause_mode = Node.PAUSE_MODE_PROCESS
		dialog.connect('timeline_end', self, 'unpauseProloguePart3')
		add_child(dialog)
	
func unpauseProloguePart3(timeline_name):
	get_tree().paused = false
	Fade.change_scene("res://Scenes/thrishaStuff/Locations/Overworld/Dream.tscn")
	yield(get_tree().create_timer(2), "timeout")
	
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
		
func unpause(timeline_name):
	get_tree().paused = false
	canPlayerMove = true
