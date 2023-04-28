extends Area2D

var active = false

# Called when the node enters the scene tree for the first time.
#func _ready():
#	connect("body_entered", self, "_on_Bed_body_entered")
#	connect("body_exited", self, "_on_Bed_body_exited")
	
func _process(_delta):
	$QuestionMark.visible = active

func _input(event):
	if get_node_or_null('DialogNode') == null:
		if event.is_action_pressed("ui_accept") and active:
			
			if(StoryVariables.isPrologueDone == true):
				get_tree().paused = true
				var dialog = Dialogic.start("initiateMainQuest")
				dialog.pause_mode = Node.PAUSE_MODE_PROCESS
				dialog.connect('timeline_end', self, 'unpause')
				add_child(dialog)
				StoryVariables.isInitiateMainQuestDone = true
			elif(StoryVariables.isReportBackToMusicGeek == true):
				get_tree().paused = true
				var dialog = Dialogic.start("deliverStringsToBard")
				dialog.pause_mode = Node.PAUSE_MODE_PROCESS
				dialog.connect('timeline_end', self, 'unpause')
				add_child(dialog)
				StoryVariables.isDeliverStringsToBard = true

func unpause(timeline_name):
	get_tree().paused = false
	active = false

func _on_Bard_body_entered(body):
	if body.name == 'player':
		active = true

func _on_Bard_body_exited(body):
	if body.name == 'player':
		active = false
