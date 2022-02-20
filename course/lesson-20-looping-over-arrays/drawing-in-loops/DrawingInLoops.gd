extends DrawingTurtle


func _run():
	draw_speed = 800
	reset()
	run()
	play_draw_animation()

# EXPORT draw
var rectangle_sizes = [Vector2(200, 120), Vector2(140, 80), Vector2(80, 140)]

func run():
	for size in rectangle_sizes:
		draw_rectangle(size.x, size.y)
		jump(size.x, size.y)
# /EXPORT draw


func draw_rectangle(length, height):
	move_forward(length)
	turn_right(90)
	move_forward(height)
	turn_right(90)
	move_forward(length)
	turn_right(90)
	move_forward(height)
	turn_right(90)


func _ready() -> void:
	if not is_connected("turtle_finished", self, "_complete_run"):
		connect("turtle_finished", self, "_complete_run")
	_run()


func _complete_run() -> void:
	yield(get_tree().create_timer(0.5), "timeout")
	Events.emit_signal("practice_run_completed")
