require 'spec_helper'





RSpec.describe Cell do
  it 'exists' do
    cell = Cell.new("B4")
    expect(cell).to be_a Cell
  end

  it 'has a coordinate method' do
    cell = Cell.new("B4")
    expect(cell.coordinate).to eq("B4")
  end

  it 'has a ship thats nil' do
    cell = Cell.new("B4")
    expect(cell.ship).to eq(nil)
  end

  it 'has a default value of empty' do
    cell = Cell.new("B4")
    expect(cell.empty?).to eq true
  end

  it "has a place_ship method" do
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)
    cell.place_ship(cruiser)
    expect(cell.ship).to eq(cruiser)

    expect(cell.empty?).to eq(false)
  end

  




end
