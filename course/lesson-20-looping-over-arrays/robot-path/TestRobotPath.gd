extends PracticeTester

var game_board: Node2D
var robot: Node2D
var path_cell := []
var path_position := []


func _prepare() -> void:
	game_board = _scene_root_viewport.get_child(0)
	robot = game_board.get_node("Robot")
	path_cell = game_board.robot_path
	path_position = robot.points


func test_robot_moves_along_blue_path() -> String:
	if game_board.EXPECTED_PATH != path_cell:
		return tr("The robot's path changed. Did you change the robot_path array?")

	if path_position.size() == 0:
		return tr("The robot didn't move at all. Did you call robot.move_to()?")

	for point in path_position:
		if point != Vector2.ZERO and point in path_cell:
			return tr("The coordinates the robot should move to look like grid cell coordinates. Did you call cell_to_position()?")
	return ""


func test_code_uses_move_to() -> String:
	if not "robot.move_to" in _slice.current_text:
		return tr("We found no call to the robot's move_to() function. Did you forget to call it?")
	return ""
