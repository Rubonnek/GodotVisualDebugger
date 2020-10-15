extends Node

const FULL_CIRCLE_IN_DEGREES : float = 360.0 # To avoid having magic numbers.
const TO_SECONDS_MULTIPLIER : int = 1000 # To avoid having magic numbers.
const APPROXIMATION_FLOAT : float = .000001 # To avoid having magic numbers.
const NORMALIZED_UPPER_BOUND : float = 1.0 - APPROXIMATION_FLOAT # For speed and convenience.
const POSITIVEINFINITY : float = 3.402823e+38 # For convenience.
const NEGATIVEINFINITY : float = -2.802597e-45 # For convenience.
const CANVAS_LAYER_ID : int = 127 # To avoid having magic numbers.

onready var cached_root : Node = get_tree().get_root() # For speed and convenience.
var visual_debugger : CanvasLayer = preload("./VisualDebugger.tscn").instance() # To have persistent visual game debugger.

func _ready():
	visual_debugger.set_layer(CANVAS_LAYER_ID)
	add_child(visual_debugger)

func lerp_array(from_array, to_array, speed):
	for i in range(0, from_array.size()):
		from_array[i] = lerp(from_array[i], to_array[i], speed)
	return from_array
