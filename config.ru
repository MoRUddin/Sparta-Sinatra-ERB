require "sinatra"
require "sinatra/reloader" if development?
require_relative "./controllers/main_controller.rb"

run GamesController
