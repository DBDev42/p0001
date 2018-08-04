extends Node

const DEFAULT_PATH = "user://"
const DEFAULT_SETTINGS_FILENAME = "p0001.ini"

export var ui_locale = "es"

var current_state

func _ready():
	randomize()
	load_settings()
	start()

func load_settings() :
	var settings = ConfigFile.new()
	var file_status = settings.load(DEFAULT_PATH + DEFAULT_SETTINGS_FILENAME)
	if file_status == OK :
		ui_locale = settings.get_value("ui", "locale", ui_locale)
	else :
		create_settings_file(settings)

func create_settings_file(settings) :
	settings.set_value("ui", "locale", ui_locale)
	settings.save(DEFAULT_PATH + DEFAULT_SETTINGS_FILENAME)

func start() :
	$StateMachine.change_to_state("Chapter01")