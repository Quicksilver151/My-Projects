extends RichTextLabel
var AUTOTYPE_SPEED = 4
func autotype(text_node, text: String, speed := AUTOTYPE_SPEED):
    if text_node is Label:
        text_node.text = text
    else:
        text_node.bbcode_text = text
    text_node.visible_characters = 0
    yield(get_tree(), "idle_frame")
    var max_chars = text_node.get_total_character_count()
    while text_node.visible_characters < max_chars:
        text_node.visible_characters += 1
        yield(get_tree().create_timer(speed), "timeout")