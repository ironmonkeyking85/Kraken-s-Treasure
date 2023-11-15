class_name StateMechine

extends Node

@export var CURRENT_STATE: State
var states: Dictionary = {}

func _ready():
	for child in get_children():
		if child is State:
			states[child.name] = child
			child.statechange.connect(on_child_statechange)
		else:
			push_warning("State Mechine contains incompatible child node")
			
	CURRENT_STATE.enter()
	
func  _process(delta):
	CURRENT_STATE.update(delta)
	
func _physics_process(delta):
	CURRENT_STATE.physics_update(delta)
	
func  on_child_statechange(new_state: StringName) -> void:
	var active_state = states.get(new_state)
	if new_state != null:
		if active_state != CURRENT_STATE:
			CURRENT_STATE.exit()
			active_state.enter()
			CURRENT_STATE = active_state
	else:
		push_warning("State does not exist")								

