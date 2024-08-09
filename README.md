# Game Jam Template & Addons

There are no examples and barely any documentation, so use this at your own risk

I'm planning to properly document this at some point, but for now it's mostly for personal use

If you dare to try you can either:

- Clone the repo and use it as a template
- Clone the repo and add copy individual addons from the addons folder into your project

## MenuManager

A template for the main menu, options menu with volume settings and pause menu

### Features

- MenuContainer and MenuContent
	- Use MenuContainer to switch between MenuContent
	- MenuConten extends the Control node, so you can put anything you like inside it 
	- Set a default MenuContent on a MenuContainer 
	- Inside MenuContent you get a handle to the MenuContainer that you can use to switch MenuContent
		- See MenuContentButton and MenuBackButton for an example
	- It keeps track of previous MenuContent, so you can easily go back to the previous content
- PauseMenu
	- Extends MenuContainer
	- Add it to a scene where you want the game to be pausable. The content is hidden when the game is not paused
- Buttons
	- MenuBackButton - go to a previous MenuContent or unpause the game when it was paused using PauseManager
		- You need a refference to a MenuContent to use it, so only use it inside of a MenuContent
	- MenuContentButton - change content to a new one
		- You need a refference to a MenuContent to use it, so only use it inside of a MenuContent
	- MenuSceneButton - change scene
- VolumeSlider
	- A slider that you can set to control any Audio Bus

## InputBuffer

A simplified version of this addon: [johnnyneverwalked/godot-input-buffer](https://github.com/johnnyneverwalked/godot-input-buffer/tree/godot-4)

### Project Settings

Before using the addon — you need to set actions that will be buffered in the project settings

- `input_buffer/input_buffer/buffer_ms`
	- How long the action will be buffered. In milliseconds
- `input_buffer/input_buffer/action_list`
	- A list of actions that will be buffered

### Features

- InputBuffer Autoload
	- `is_action_buffered(action: String) -> bool`
		- Check if the action is buffered
	- `is_action_buffered_or_pressed(action: String) -> bool`
		- Check if the action is buffered or currently pressed

## Utility

### Features 

- `fi_lerp(speed: float, delta: float)` -> float
	- A formula for [framerate independent lerp](https://www.rorydriscoll.com/2016/03/07/frame-rate-independent-damping-using-lerp/)
	- Example: `lerp(..., Utility.fi_lerp(15.0, delta))`
	- Average recomended speed value is around 10.0 - 20.0
- `disable_collisions(node: Node) -> void` and `enable_collisions(node: Node) -> void`
	- Loop through children of the node and enable/disable all the collisions

## CommonComponents

A collection of common components for an action game: 

- Health Component
- Hitbox Component
- Hurtbox Component
- Hit Flash Component
- Velocity Component
- Interaction Component
- Interaction Manager

## MusicManager

Play music. Stop music. Fade music. Change music with a fade

### Features:

- MusicManager Autoload
- MusicRequest Node

## VfxManager

### Features:
	
- Camera Shake
- Screen Flash
- Screen Fade
- Freeze Frame

## SceneManager

### Features

- SceneManager Autoload
	- Has same methods as SceneTree for changing scenes
	- Uses VFXManager screen fade
	
## Other addons

[Godot Quick Scenes](https://github.com/KoBeWi/Godot-Quick-Scenes) by [KoBeWi](https://github.com/KoBeWi)

[BMOD](htps://github.com/Toldoven/bmod) by [Me](https://github.com/Toldoven)

## Project Template

- Change Default Audio Bus 
- Main Menu Ccene
- Main Game Scene
- Project Structure
- Enforce Static Typing
- Vignette Shader
- Hit Flash Shader
- Prototype Assets
- Particle Assets
- Limit FPS to 60 in order to prevent jittering 
- Window Settings
