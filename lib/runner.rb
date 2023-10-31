require 'pry'
require './spec/spec_helper'

puts "Welcome to BATTLESHIP"
puts "Enter p to play. Enter q to quit."
main_menu_response = gets.chomp

game = Game.new
game.play(main_menu_response)
