extends GridContainer

var selected_char1 = null
var selected_char2 = null

var tempPos1 = 0
var tempPos2 = 0

var player1_position = 0
var player2_position = 0

var maxPos = 0

func _ready():
	for i in get_children():
		maxPos += 1
		
	player1_position = 0
	player2_position = 1
		
func _input(event):
	
	var player1 = get_parent().get_node("player1")
	var player2 = get_parent().get_node("player2")

	if (event.is_action_pressed("ui_left2")):
		tempPos1 = player1_position - 1
		if player1_position <= 0:
			player1_position = 0
		else:
			if tempPos1 == player2_position:
				player1_position -= 2
			else:
				player1_position -= 1

	if (event.is_action_pressed("ui_right2")):
		tempPos1 = player1_position + 1
		if player1_position >= maxPos - 1:
			player1_position = maxPos - 1
		else:
			if tempPos1 == player2_position:
				player1_position += 2
			else:
				player1_position += 1

	if (event.is_action_pressed("ui_left")):
		tempPos2 = player2_position - 1
		if player2_position <= 0:
			player2_position = 0
		else:
			if tempPos2 == player1_position:
				player2_position -= 2
			else:
				player2_position -= 1

	elif (event.is_action_pressed("ui_right")):
		tempPos2 = player2_position + 1
		if player2_position >= maxPos - 1:
			player2_position = maxPos - 1
		else:	
			if tempPos2 == player1_position:
				player2_position += 2
			else:
				player2_position += 1
	
	if (event.is_action_pressed("ui_select")):
		selected_char1 = get_child(player1_position)
		print(selected_char1)
	
	elif (event.is_action_pressed("ui_select2")):
		selected_char2 = get_child(player2_position)
		print(selected_char2)

	# Update the positions of the texture rects
	var texture_rect_1 = get_child(player1_position)
	player1.global_position = texture_rect_1.get_global_position() + texture_rect_1.rect_size / 2

	var texture_rect_2 = get_child(player2_position)
	player2.global_position = texture_rect_2.get_global_position() + texture_rect_2.rect_size / 2
	
	if (selected_char1 != null) and (selected_char2 != null):
		if (event.is_action_pressed("ui_accept")):
			print("yasta")
			get_tree().change_scene("res://Escenas/inGame.tscn")
