class_name State
extends Node

 # Constants for the names of animation and audio nodes
const character_animation_name: String = "Animation"
const character_aduio_name: String = "Audio"

# Exported variables for the state and animation names
@export var state_name : String = ""
@export var animation_name : String = ""

# References to the character body, animation player, and audio nodes
var characterbody_reference : CharacterBody2D = null
var animation_reference : AnimationPlayer = null
var audio_reference : Node = null

# Function to initialize the state with a character body
# This function is called to set up the state with the necessary references,
# including the character body, animation player, and audio nodes.
func Initialize( character_body : CharacterBody2D ) -> void:
	characterbody_reference = character_body
# Get the animation player node from the character body.	
	animation_reference = character_body.get_node(character_animation_name)
# Get the audio node from the character body.	
	audio_reference = character_body.get_node(character_aduio_name)

# Function called when entering the state
# This function is invoked when the state is entered.
# It plays the specified animation using the animation player.
func enter() -> void:
	animation_reference.play(animation_name)

# Function called when exiting the state
# This function is called when the state is exited.
# It currently does nothing (placeholder pass statement).	
func exit() -> void:
	pass
	
# Function to handle input events and transition between states
# This function is responsible for handling input events and determining
# the next state based on the received input. In this case, it always returns
# the INVALID state, signaling that the state transition is not determined by input.
func input(event : InputEvent) -> StateMachine.PlAYERSTATES:
	return StateMachine.PlAYERSTATES.INVALID
	
# Function for main updates, returning the next state
# These functions are responsible for updating the state during the main and
# physics processing loops. In this case, both functions always return the
# INVALID state, indicating that the state transition is not determined by updates.
func main_update(_delta : float) -> StateMachine.PlAYERSTATES:
	return StateMachine.PlAYERSTATES.INVALID
	
# Function for physics updates, returning the next state
# Similar to main_update, these functions handle updates during the physics processing.
# They also always return the INVALID state, suggesting that physics updates do not
# determine state transitions in this context.
func physics_update(_delta: float) -> StateMachine.PlAYERSTATES:
	return StateMachine.PlAYERSTATES.INVALID



