extends Node

const DEFAULT_PATH = "user://"
const DEFAULT_SETTINGS_FILENAME = "p0001.ini"

export var ui_locale = "es"
export var ui_name = "p0001"
export var initial_state = "Chapter01"

var current_state

func _ready():
	randomize()
	load_settings()
	start()

func load_settings() :
	var settings = ConfigFile.new()
	var file_status = settings.load(DEFAULT_PATH + DEFAULT_SETTINGS_FILENAME)
	if file_status == OK :
		read_settings_file(settings)
	else :
		create_settings_file(settings)

func read_settings_file(settings) :
	ui_locale = settings.get_value("ui", "locale", ui_locale)
	ui_name = settings.get_value("ui", "name", ui_name)

func create_settings_file(settings) :
	settings.set_value("ui", "locale", ui_locale)
	settings.set_value("ui", "name", ui_name)
	settings.save(DEFAULT_PATH + DEFAULT_SETTINGS_FILENAME)

func start() :
	OS.set_window_title(ui_name)
	$StateMachine.change_to_state(initial_state)