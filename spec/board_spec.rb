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
    expect(board.cells.count).to eq(16)
  end

  describe '# valid_coordinate?' do
    it 'validates coordinates are on the board' do
      board = Board.new

      expect(board.valid_coordinate?("A1")).to be(true)
      expect(board.valid_coordinate?("D4")).to be(true)
      expect(board.valid_coordinate?("A5")).to be(false)
      expect(board.valid_coordinate?("E1")).to be(false)
      expect(board.valid_coordinate?("A22")).to be(false)
    end

    it 'validates number of coordinates = length of ship' do
      
    end

    it 'validates coordinates are consecutive' do

    end

    it 'validates are not diagonal' do

    end

    it 'validates final placement' do

    end

  end


end