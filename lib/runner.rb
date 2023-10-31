require 'pry'
require './spec/spec_helper'

puts "Welcome to BATTLESHIP"
puts "Enter p to play. Enter q to quit."
main_menu_response = gets.chomp


if main_menu_response == "p"
  game = Game.new
  game.place_computer_ships
  puts "I have laid out my ships on the grid."
  puts "You now need to lay out your two ships."
  puts "The Cruiser is three units long and the Submarine is two units long."
  puts game.my_board.render(true)
  puts "Enter the squares for the Cruiser (one space at a time):"
  cruiser_coordinates = []
  cruiser_coordinates << gets.chomp
  cruiser_coordinates << gets.chomp
  cruiser_coordinates << gets.chomp
  if valid_placement?(game.my_cruiser, cruiser_coordinates)
    game.my_board.place(game.my_cruiser, cruiser_coordinates)
  else
    puts "Those are invalid coordinates. Please try again:"
    #loop back to row 17
  end
  puts game.my_board.render(true)
  puts "Enter the squares for the Submarine (one space at a time):"
  submarine_coordinates = []
  submarine_coordinates << gets.chomp
  submarine_coordinates << gets.chomp
  if valid_placement?(game.my_submarine, submarine_coordinates)
    game.my_board.place(game.my_submarine, submarine_coordinates)
  else
    puts "Those are invalid coordinates. Please try again:"
  #loop back to row 29

  # Take Turns

elsif main_menu_response == "q"
  # quit game
end

