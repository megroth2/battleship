require 'spec_helper'

RSpec.describe Board do

  it 'exists' do
    board = Board.new

    expect(board).to be_instance_of(Board)
  end

  it 'has cells' do
    board = Board.new

    expect(board.cells).to be_instance_of(Hash)
    expect(board.cells["A1"]).to be_instance_of(Cell)
    expect(board.cells["A1"].coordinate).to eq("A1")
    expect(board.cells["B4"]).to be_instance_of(Cell)
    expect(board.cells["B4"].coordinate).to eq("B4")
  end


end