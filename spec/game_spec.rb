require 'spec_helper'

RSpec.describe Game do

  it 'exists' do
    game = Game.new

    expect(game.my_board).to be_instance_of(Board)
    expect(game.computer_board).to be_instance_of(Board)
    expect(game.my_cruiser).to be_instance_of(Ship)
    expect(game.my_submarine).to be_instance_of(Ship)
    expect(game.computer_cruiser).to be_instance_of(Ship)
    expect(game.computer_submarine).to be_instance_of(Ship)
  end

  it 'places computer ships' do
    game = Game.new
    game.place_computer_ships

    expect(game.computer_board.render(true).include?("S")).to be(true)
    # add a test to make sure there are 5 S's total?
  end

  it 'evaluates if the game is over' do
    game = Game.new
    game.place_computer_ships
    cruiser = Ship.new("Cruiser", 3)
    game.my_board.place(cruiser, ["A1", "A2", "A3"])

    expect(game.game_over?).to be(false)

    # Add a test to make sure game_over? == false
  end

  # xit 'takes turns' do
  #   game = Game.new

  #   expect(game.take_turn).to ...
  # end

  # xit 'renders game board' do
  #   game = Game.new

  #   expect(game.render_game_board).to ...
  # end


end