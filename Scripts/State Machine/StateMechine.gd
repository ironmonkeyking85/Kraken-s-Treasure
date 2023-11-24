class_name StateMachine
extends Node

enum PlAYERSTATES { IDLE, ATTACK, MOVING, DAMAGED, DISTORYED }

@export var state: State

func _ready():
	change_state(state)
								
func change_state(new_state:State):
	if state is State:
		state.exit()
	new_state.enter()
	state = new_state	
