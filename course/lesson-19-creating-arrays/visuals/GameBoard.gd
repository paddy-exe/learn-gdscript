extends Node2D

export var board_size := Vector2(6, 4) setget set_board_size
export var cell_size := Vector2(64, 64)
export var line_width := 4
export var robot_start_position := Vector2(0, 1)

var board_size_px := cell_size * board_size

# Maps nodes to grid positions
onready var units: Dictionary setget set_units
# Path to draw
var _path := []


# Draws a board grid centered on the node
func _draw() -> void:
	for x in range(board_size.x):
		for y in range(board_size.y):
			draw_rect(Rect2(Vector2(x, y) * cell_size - board_size_px / 2.0, Vector2.ONE * cell_size), Color.white, false, line_width)
	draw_path(_path)


func draw_path(cells: Array):
	var points = PoolVector2Array()
	for cell in cells:
		points.append(calculate_cell_position(cell))

	draw_polyline(points, Color("fff540"), 4.0)


func set_units(new_value: Dictionary):
	units = new_value

	for unit in units:
		var cell: Vector2 = units[unit]
		unit.position = calculate_cell_position(cell)


func calculate_cell_position(cell: Vector2):
	return cell * cell_size - board_size_px / 2.0 + cell_size / 2.0


func set_board_size(new_size: Vector2):
	board_size = new_size
