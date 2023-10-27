require 'spec_helper'

RSpec.describe Cell do
  it 'exists' do
    cell = Cell.new("B4")
    expect(cell).to be_a Cell
  end

  it 'has a coordinate attribute' do
    cell = Cell.new("B4")
    expect(cell.coordinate).to eq("B4")
  end

  it 'has a ship attribute thats nil' do
    cell = Cell.new("B4")
    expect(cell.ship).to eq(nil)
  end

  it 'has a default value of empty' do
    cell = Cell.new("B4")
    expect(cell.empty?).to eq true
  end

  it 'is not empty' do
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)
    cell.place_ship(cruiser)

    expect(cell.empty?).to eq(false)
  end

  it "has a place_ship method" do
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)
    cell.place_ship(cruiser)
    expect(cell.ship).to eq(cruiser)
    expect(cell.empty?).to eq(false)
  end

  it 'has a fired_upon? method' do
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)
    cell.place_ship(cruiser)
    cell.fired_upon?

    expect(cell.fired_upon?).to be(false)
  end

  it 'can be fired upon' do
    cell = Cell.new("B4")
    cell.fire_upon
    expect(cell.fired_upon?).to be(true)
  end

  it 'can be fired upon with a ship in it' do
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)
    cell.place_ship(cruiser)
    cell.fire_upon
    
    expect(cell.fired_upon?).to eq(true)
    expect(cell.ship.health).to eq(2)
  end




end
