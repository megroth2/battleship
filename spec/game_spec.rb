require 'spec_helper'

RSpec.describe Game do

  it 'exists' do
    game = Game.new

    expect(game).to be_instance_of(Game)
    expect(game.my_board).to be_instance_of(Board)
    expect(game.computer_board).to be_instance_of(Board)
    expect(game.my_cruiser).to be_instance_of(Ship)
    expect(game.my_submarine).to be_instance_of(Ship)
    expect(game.computer_cruiser).to be_instance_of(Ship)
    expect(game.computer_submarine).to be_instance_of(Ship)
  end


  it 'places computer ships' do
    game = Game.new

    expect(game.computer_board.cells.values.all? {|cell| cell.empty?}).to eq(true)

    game.place_computer_ships

    expect(game.computer_board.render(true).include?("S")).to be(true)
    expect(game.computer_board.render(true).count("S")).to be(5)
    expect(game.computer_board.cells.values.all? {|cell| cell.empty?}).to eq(false)
    expect(game.my_board.cells.values.all? {|cell| cell.empty?}).to eq(true)
  end

  it 'evaluates if the game is over' do
    game = Game.new
    game.place_computer_ships
    cruiser = Ship.new("Cruiser", 3)
    game.my_board.place(cruiser, ["A1", "A2", "A3"])

    expect(game.game_over?).to be(false)

    game.my_board.place(cruiser, ["A1", "A2", "A3"])

    expect(game.game_over?).to be(false)
    expect(game.my_board.cells["A1"].status).to eq(".")

    game.my_board.cells["A1"].fire_upon

    expect(game.my_board.cells["A1"].status).to eq("H")
    expect(game.game_over?).to be(false)

    game.my_board.cells["A2"].fire_upon
    game.my_board.cells["A3"].fire_upon
    game.my_board.render

    expect(game.my_board.cells["A1"].status).to eq("X")
    expect(game.game_over?).to be(true)
  end

end