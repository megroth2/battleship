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

  it 'validates coordinates are on the board' do
    board = Board.new
    
    expect(board.valid_coordinate?("A1")).to be(true)
    expect(board.valid_coordinate?("D4")).to be(true)
    expect(board.valid_coordinate?("A5")).to be(false)
    expect(board.valid_coordinate?("E1")).to be(false)
    expect(board.valid_coordinate?("A22")).to be(false)
  end
  
  describe '# valid_placement?' do
    it 'validates number of coordinates = length of ship' do
      board = Board.new
      cruiser = Ship.new("Cruiser", 3)
      submarine = Ship.new("Submarine", 2)    

      expect(board.valid_placement?(cruiser, ["A1", "A2"])).to eq(false)
      expect(board.valid_placement?(submarine, ["A2", "A3", "A4"])).to eq(false)
      expect(board.valid_placement?(cruiser, ["A2", "A3", "A4"])).to eq(true)
      expect(board.valid_placement?(submarine, ["A1", "A2"])).to eq(true)
    end

    it 'validates all coordinates are empty' do

    end

    it 'validates coordinates are consecutive' do
      board = Board.new
      cruiser = Ship.new("Cruiser", 3)
      submarine = Ship.new("Submarine", 2)    

      expect(board.valid_placement?(cruiser, ["A1", "A2", "A4"])).to eq(false)
      expect(board.valid_placement?(submarine, ["A1", "C1"])).to eq(false)
      expect(board.valid_placement?(cruiser, ["A3", "A2", "A1"])).to be(true) # we don't think this should be false
      expect(board.valid_placement?(submarine, ["C1", "B1"])).to be(true) # we don't think this should be false
      expect(board.valid_placement?(cruiser, ["A1", "A2", "A3"])).to eq(true)
      expect(board.valid_placement?(submarine,["A1", "A2"])).to be(true)
    end

    it 'validates are not diagonal' do
      board = Board.new
      cruiser = Ship.new("Cruiser", 3)
      submarine = Ship.new("Submarine", 2) 

      expect(board.valid_placement?(cruiser, ["A1", "B2", "C3"])).to be(false)
      expect(board.valid_placement?(submarine, ["C2", "D3"])).to be(false)
    end

    it 'validates final placement' do
      board = Board.new
      cruiser = Ship.new("Cruiser", 3)
      submarine = Ship.new("Submarine", 2) 

      expect(board.valid_placement?(submarine, ["A1", "A2"])).to be(true)
      expect(board.valid_placement?(cruiser, ["B1", "C1", "D1"])).to be (true)
      expect(board.valid_placement?(cruiser, ["A1", "A2"])).to be(false)
      expect(board.valid_placement?(submarine, ["B1", "C1", "D1"])).to be (false)
      expect(board.valid_placement?(cruiser, ["A3", "A4", "A5"])).to eq(false) #integration test example
    end
  end

  describe "# place" do
    it 'places ship' do
      board = Board.new
      cruiser = Ship.new("Cruiser", 3)  
      board.place(cruiser, ["A1", "A2", "A3"])
      cell_1 = board.cells["A1"]
      cell_2 = board.cells["A2"]
      cell_3 = board.cells["A3"]  

      expect(cell_1).to be_instance_of(Cell)
      expect(cell_2).to be_instance_of(Cell)
      expect(cell_3).to be_instance_of(Cell)
      expect(cell_1.ship).to be_instance_of(Ship)
      expect(cell_2.ship).to be_instance_of(Ship)
      expect(cell_3.ship).to be_instance_of(Ship)
      expect(cell_1.ship == cell_2.ship).to be(true)
      expect(cell_2.ship == cell_3.ship).to be(true)
      expect(cell_1.ship == cell_3.ship).to be(true)
      expect(board.cells["A1"].empty?).to eq(false)
      expect(board.cells["B1"].empty?).to eq(true)
    end

    it 'prevents overlapping ships' do
      board = Board.new
      cruiser = Ship.new("Cruiser", 3) 
      submarine = Ship.new("Submarine", 2) 
      board.place(cruiser, ["A1", "A2", "A3"])
      
      expect(board.valid_placement?(submarine, ["A1", "B1"])).to eq(false)
      
      board_2 = Board.new
      cruiser_2 = Ship.new("Cruiser", 3) 
      submarine_2 = Ship.new("Submarine", 2) 
      board_2.place(submarine_2, ["B2", "C2"])

      expect(board_2.valid_placement?(cruiser_2, ["B1", "B2", "B3"])).to eq(false)
    end
  end

  it 'renders the board' do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    board.place(cruiser, ["A1", "A2", "A3"])  

    expect(board.render).to eq("  1 2 3 4 \nA . . . . \nB . . . . \nC . . . . \nD . . . . \n")
    expect(board.render(true)).to eq("  1 2 3 4 \nA S S S . \nB . . . . \nC . . . . \nD . . . . \n")

    board.cells["A1"].fire_upon

    expect(board.render).to eq("  1 2 3 4 \nA H . . . \nB . . . . \nC . . . . \nD . . . . \n")
    expect(board.render(true)).to eq("  1 2 3 4 \nA H S S . \nB . . . . \nC . . . . \nD . . . . \n")

    board.cells["D1"].fire_upon

    expect(board.render).to eq("  1 2 3 4 \nA H . . . \nB . . . . \nC . . . . \nD M . . . \n")
    expect(board.render(true)).to eq("  1 2 3 4 \nA H S S . \nB . . . . \nC . . . . \nD M . . . \n")
  end

  it 'generates random coordinate' do
    board = Board.new

    expect(board.random_coordinate).to be_instance_of(String)
    expect(board.valid_coordinate?(board.random_coordinate)).to eq(true)
  end

end