require 'pry'
require './spec/spec_helper'

puts "Welcome to BATTLESHIP"
puts "Enter p to play. Enter q to quit."
main_menu_response = gets.chomp


if main_menu_response == "p"
  game = Game.new

elsif main_menu_response == "q"
  # quit game
end

puts game.my_board

