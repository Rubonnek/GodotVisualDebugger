extends Button

func _on_JumpToSelectedNodeButton_pressed():
	if get_parent().get_node("ShowNodeInfoButton"):
		var selected_node_path = VDGlobal.visual_debugger.full_selected_path
		if selected_node_path != "":
			var node = get_node(selected_node_path)
			if node != null:
				# do not follow nodes without transform
				if node.has_method("get_global_transform"):
					var relative_position = node.get_global_transform().origin # For speed and convenience.
					VDGlobal.visual_debugger.set_moving_to_node(true, relative_position)
				else:
					VDGlobal.visual_debugger.is_moving_to_node = false
			else:
				print("Oh, noh, nothing to follow, level probably got reloaded!")
		else:
			VDGlobal.visual_debugger.warning_line.text = "There is no node selected! Please select a node, to which to jump."
	else:
		VDGlobal.visual_debugger.warning_line.text = "The selected info node path is incorrect! Maybe node is removed from node tree."
