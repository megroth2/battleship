require 'spec_helper'

RSpec.describe Game do

  it 'exists' do
    game = Game.new

    expect(game.my_board).to be_instance_of(Board)
    expect(game.computer_board).to be_instance_of(Board)
  end

  it 'evaluates if the game is over' do


  end

  it 'places computer ships' do
    game = Game.new
    game.place_computer_ships(game.computer_cruiser)

  end

end