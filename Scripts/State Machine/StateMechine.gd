class_name StateMachine
extends Node

# links to StateMachine tutorials-- 
# https://www.nightquestgames.com/how-to-build-state-machines-in-godot-4/
# https://www.youtube.com/@uheartbeast ,  https://youtu.be/qwOM3v8T33Q?si=6udP4TlX_t7EWECm
# https://www.gdquest.com/tutorial/godot/design-patterns/finite-state-machine/
# https://shaggydev.com/2023/10/08/godot-4-state-machines/ ,  https://youtu.be/oqFbZoA2lnU?si=whz4ahq72KPsI7-F

# Enumeration for player states
enum PlAYERSTATES { IDLE, ATTACK, MOVING, DAMAGED, DISTORYED, INVALID }

# Exported variables for the character and initial state.
# These variables are exposed in the editor, allowing the user to assign values.
@export var character : CharacterBody2D = null
@export var initialestate : State = null

# Variable to store the current state of the player.
# This variable is used to keep track of the current state in the state machine.
var current_state : State = null
 
# Function called when the node is ready
# This function is automatically called when the node is ready.
# It initializes the states by calling their 'Initialize' function,
# passing the character reference. It then sets the current state to
# the initial state and calls the 'change_state' function to enter
# the initial state.
func _ready() -> void:
# Loop through each child node of the StateMachine node.
	for child in get_children():
# Cast the child node to the State class.		
		var state_node : State = child as State
# Initialize the state node with the character reference.		
		state_node.Initialize(character)

# Set the current state to the initial state.	
	current_state = initialestate
# Call the 'change_state' function to enter the initial state.	
	change_state(initialestate)	

# Function to handle input events and transition between states	
# This function is called in response to input events.
# It delegates the input handling to the current state's 'input' function,
# which returns the next state. If the next state is valid, it changes
# the current state to the new state using the 'change_state' function.
func _input(event : InputEvent) -> void:
# Get the next state based on the input event.	
	var nextstate : PlAYERSTATES = current_state.input(event)
# Check if the next state is valid.	
	if (nextstate != PlAYERSTATES.INVALID):
# Change the current state to the new state.		
		change_state(get_child(nextstate))
		
# Function for the main process, handling state transitions
# This function is called during the main processing loop.
# It delegates the main update to the current state's 'main_update' function,
# which returns the next state. If the next state is valid, it changes
# the current state to the new state using the 'change_state' function.		
func _process(delta: float) -> void:	
	var nextstate : PlAYERSTATES = current_state.main_update(delta)
	if (nextstate != PlAYERSTATES.INVALID):
		change_state(get_child(nextstate))
		
# Function for physics process, handling state transitions	
# This function is called during the physics processing loop.
# It delegates the physics update to the current state's 'physics_update' function,
# which returns the next state. If the next state is valid, it changes
# the current state to the new state using the 'change_state' function.	
func _physics_process(delta: float) -> void:
	var nextstate : PlAYERSTATES = current_state.physics_update(delta)
	if (nextstate != PlAYERSTATES.INVALID):
		change_state(get_child(nextstate))

# Function to change the current state
# This function is responsible for changing the current state.
# It calls the 'exit' function of the current state, then updates
# the current state to the new state and calls its 'enter' function.		
func change_state(nextstate : State) -> void:
	current_state.exit()
	current_state = nextstate
	current_state.enter()		
			
		
		
