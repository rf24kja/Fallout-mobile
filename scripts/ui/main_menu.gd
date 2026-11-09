extends Control

## Main menu scene for Fallout 2 Reborn Mobile demo.
## Handles Start Game, Continue Game (if save exists), Options, Quit.

signal game_started
signal continue_game
signal options_requested
signal quit_requested

var start_button: Button
var continue_button: Button
var options_button: Button
var quit_button: Button

var _save_system
var _game_manager
var _event_bus

func _ready() -> void:
     print("MainMenu: _ready() called")
     # Write debug to file (works on Android)
     var debug_file = FileAccess.open("user://mainmenu_debug.txt", FileAccess.WRITE)
     if debug_file:
         debug_file.store_line("MainMenu: _ready() called")
         debug_file.store_line("MainMenu: MainMenu global_position = " + str(global_position))
         debug_file.store_line("MainMenu: MainMenu size = " + str(size))
     
     _save_system = get_node_or_null("/root/SaveSystem")
     _game_manager = get_node_or_null("/root/GameManager")
     _event_bus = get_node_or_null("/root/EventBus")
     
     # Find buttons using get_node_or_null since @onready paths don't resolve in headless
     start_button = get_node_or_null("ButtonContainer/StartButton")
     continue_button = get_node_or_null("ButtonContainer/ContinueButton")
     options_button = get_node_or_null("ButtonContainer/OptionsButton")
     quit_button = get_node_or_null("ButtonContainer/QuitButton")
     
     if debug_file:
         debug_file.store_line("MainMenu: start_button = " + str(start_button))
         debug_file.store_line("MainMenu: continue_button = " + str(continue_button))
         debug_file.store_line("MainMenu: options_button = " + str(options_button))
         debug_file.store_line("MainMenu: quit_button = " + str(quit_button))
         debug_file.store_line("MainMenu: children = " + str(get_children()))
     
# Debug button properties
      var button_container = get_node_or_null("ButtonContainer")
      if start_button:
          if debug_file:
              debug_file.store_line("MainMenu: start_button rect = " + str(start_button.get_rect()))
              debug_file.store_line("MainMenu: start_button global_position = " + str(start_button.global_position))
              debug_file.store_line("MainMenu: start_button visible = " + str(start_button.visible))
              debug_file.store_line("MainMenu: start_button size_flags = " + str(start_button.size_flags_horizontal) + ", " + str(start_button.size_flags_vertical))
              debug_file.store_line("MainMenu: start_button custom_minimum_size = " + str(start_button.custom_minimum_size))
              debug_file.store_line("MainMenu: start_button mouse_filter = " + str(start_button.mouse_filter))
              debug_file.store_line("MainMenu: start_button focus_mode = " + str(start_button.focus_mode))
      if button_container:
          if debug_file:
              debug_file.store_line("MainMenu: ButtonContainer rect = " + str(button_container.get_rect()))
              debug_file.store_line("MainMenu: ButtonContainer global_position = " + str(button_container.global_position))
              debug_file.store_line("MainMenu: ButtonContainer children = " + str(button_container.get_children()))
              debug_file.store_line("MainMenu: ButtonContainer size_flags = " + str(button_container.size_flags_horizontal) + ", " + str(button_container.size_flags_vertical))
      if debug_file:
          debug_file.close()
      
      # Check for existing save to enable Continue button
      _check_save_exists()
      
      # Connect button signals
      _connect_buttons()
      
      # Listen for save system signals (if signals exist)
      if _save_system and _save_system.has_signal("save_created"):
          _save_system.save_created.connect(_on_save_changed)
      if _save_system and _save_system.has_signal("save_deleted"):
          _save_system.save_deleted.connect(_on_save_changed)
      
      # Set initial state
      visible = true
      mouse_filter = 1  # PASS - allow touch events to reach child buttons
      focus_mode = 2    # ALL focus mode
      
      # Force grab focus
      call_deferred("_grab_focus")
    
    # Debug: listen for input events
      print("MainMenu: _input_ready connected")

func _connect_buttons() -> void:
     if start_button:
         start_button.pressed.connect(_on_start_pressed)
         start_button.mouse_entered.connect(_on_start_mouse_entered)
         start_button.mouse_exited.connect(_on_start_mouse_exited)
         # Ensure button receives mouse events
         start_button.mouse_filter = 0  # STOP
         start_button.focus_mode = 2  # ALL
         # Force button to be focusable and clickable
         start_button.button_group = null
         print("MainMenu: StartButton connected, mouse_filter=" + str(start_button.mouse_filter) + ", focus_mode=" + str(start_button.focus_mode))
     if continue_button:
         continue_button.pressed.connect(_on_continue_pressed)
         continue_button.mouse_filter = 0
         continue_button.focus_mode = 2
         continue_button.button_group = null
     if options_button:
         options_button.pressed.connect(_on_options_pressed)
         options_button.mouse_filter = 0
         options_button.focus_mode = 2
         options_button.button_group = null
     if quit_button:
         quit_button.pressed.connect(_on_quit_pressed)
         quit_button.mouse_filter = 0
         quit_button.focus_mode = 2
         quit_button.button_group = null

func _grab_focus() -> void:
    grab_focus()
    if start_button:
        start_button.grab_focus()

func _on_start_mouse_entered() -> void:
    print("MainMenu: StartButton mouse_entered")

func _on_start_mouse_exited() -> void:
    print("MainMenu: StartButton mouse_exited")

func _check_save_exists() -> void:
    if _save_system and continue_button:
        var has_save = _save_system.has_save(0)
        continue_button.disabled = not has_save
        if has_save:
            continue_button.text = "ПРОДОЛЖИТЬ"
        else:
            continue_button.text = "ПРОДОЛЖИТЬ (нет сохранения)"

func _on_start_pressed() -> void:
     print("MainMenu: Start Game pressed")
     var debug_file = FileAccess.open("user://mainmenu_debug.txt", FileAccess.WRITE)
     if debug_file:
           debug_file.store_line("MainMenu: Start Game pressed")
           debug_file.close()
     # Reset game state for new game
     if _game_manager:
           _game_manager._load_default_state()
           _game_manager.change_state(1)  # PLAYING
           _game_manager.current_map = "test_map"
     if _event_bus:
           _event_bus.emit_signal("scene_change_requested", "res://scenes/world/test_map.tscn")
     _emit_game_started()

func _on_continue_pressed() -> void:
    print("MainMenu: Continue Game pressed")
    if _save_system and _save_system.has_save(0):
        var data = _save_system.load_game(0)
        if data:
            if _game_manager:
                _game_manager.load_save_data(data)
                _game_manager.change_state(1)  # PLAYING
    _emit_continue_game()

func _on_options_pressed() -> void:
    print("MainMenu: Options pressed")
    options_requested.emit()

func _on_quit_pressed() -> void:
    print("MainMenu: Quit pressed")
    quit_requested.emit()

func _on_save_changed() -> void:
    _check_save_exists()

func _emit_game_started() -> void:
    game_started.emit()
    visible = false

func _emit_continue_game() -> void:
    continue_game.emit()
    visible = false

func show_menu() -> void:
     visible = true
     _check_save_exists()

func _input(event: InputEvent) -> void:
     if event is InputEventScreenTouch:
         print("MainMenu: _input ScreenTouch pressed=" + str(event.pressed) + " pos=" + str(event.position) + " global_pos=" + str(get_global_mouse_position()))
         var debug_file = FileAccess.open("user://mainmenu_debug.txt", FileAccess.READ_WRITE)
         if debug_file:
             debug_file.seek_end()
             debug_file.store_line("MainMenu: _input ScreenTouch pressed=" + str(event.pressed) + " pos=" + str(event.position) + " global_pos=" + str(get_global_mouse_position()))
             debug_file.close()
     if event is InputEventScreenDrag:
         print("MainMenu: _input ScreenDrag pos=" + str(event.position))
     if event is InputEventMouseButton:
         print("MainMenu: _input MouseButton button_index=" + str(event.button_index) + " pressed=" + str(event.pressed) + " pos=" + str(event.position) + " global_pos=" + str(get_global_mouse_position()))