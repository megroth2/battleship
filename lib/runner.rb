require 'pry'
require './spec/spec_helper'

main_menu_response = ""

until main_menu_response == "q"
  puts "Welcome to BATTLESHIP"
  puts "Enter p to play. Enter q to quit."
  main_menu_response = gets.chomp

  game = Game.new
  game.play(main_menu_response)
end
