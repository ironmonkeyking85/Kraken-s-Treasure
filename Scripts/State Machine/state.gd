class_name State
extends Node

const character_animation_name: String = "Animation"
const character_aduio_name: String = "Audio"

@export var state_name : String = ""
@export var animation_name : String = ""

var characterbody_reference : CharacterBody2D = null
var animation_reference : AnimationPlayer = null
var audio_reference : Node = null

func Initialize( character_body : CharacterBody2D ) -> void:
	characterbody_reference = character_body
	animation_reference = character_body.get_node(character_animation_name)
	audio_reference = character_body.get_node(character_aduio_name)

func enter() -> void:
	animation_reference.play(animation_name)
	
func exit() -> void:
	pass
	
func input(event : InputEvent) -> StateMachine.StateType:
	return StateMachine.StateType.Invalid

func main_update(_delta : float) -> StateMachine.StateType:
	return StateMachine.StateType.Invalid
	

func physics_update(_delta: float) -> StateMachine.StateType:
	return StateMachine.StateType.Invalid



