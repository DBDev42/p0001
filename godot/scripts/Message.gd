extends NinePatchRect

signal button_released(button)

func set_only_message(connector, message) :
	self.connect("button_released", connector, "_on_button_released")
	$Text.set_text(message)
	$ButtonRight.hide()
	$ButtonCenter.hide()
	$ButtonLeft.hide()

func set_one_button_message(connector, message, button_right) :
	set_only_message(connector, message)
	$ButtonRight/Text.set_text(button_right)
	$ButtonRight.show()

func set_two_buttons_message(connector, message, button_right, button_center) :
	set_one_button_message(connector, message, button_right)
	$ButtonCenter/Text.set_text(button_center)
	$ButtonCenter.show()

func set_three_buttons_message(connector, message, button_right, button_center, button_left) :
	set_two_buttons_message(connector, message, button_right, button_center)
	$ButtonLeft/Text.set_text(button_left)
	$ButtonLeft.show()

func set_button_right(button_right) :
	$ButtonRight/Text.set_text(button_right)

func _on_ButtonRight_button_down() :
	$ButtonRight/Text.set_position($ButtonRight/Text.get_position() + Vector2(0,1))

func _on_ButtonRight_button_up() :
	$ButtonRight/Text.set_position($ButtonRight/Text.get_position() - Vector2(0,1))
	emit_signal("button_released", $ButtonRight/Text.get_text())

func _on_ButtonCenter_button_down() :
	$ButtonCenter/Text.set_position($ButtonCenter/Text.get_position() + Vector2(0,1))

func _on_ButtonCenter_button_up() :
	$ButtonCenter/Text.set_position($ButtonCenter/Text.get_position() - Vector2(0,1))
	emit_signal("button_released", $ButtonCenter/Text.get_text())

func _on_ButtonLeft_button_down() :
	$ButtonLeft/Text.set_position($ButtonLeft/Text.get_position() + Vector2(0,1))

func _on_ButtonLeft_button_up() :
	$ButtonLeft/Text.set_position($ButtonLeft/Text.get_position() - Vector2(0,1))
	emit_signal("button_released", $ButtonLeft/Text.get_text())
