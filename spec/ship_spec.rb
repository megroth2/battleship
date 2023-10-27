require 'spec_helper'

require "./lib/ship.rb"

RSpec.describe Ship do
  it "exists and has a name and length and health" do
    cruiser = Ship.new("Cruiser", 3)
    expect(cruiser).to be_a Ship
    expect(cruiser.name).to eq("Cruiser")
    expect(cruiser.length).to eq(3)
    expect(cruiser.health).to eq(3)
  end

  it "has a sunk? method" do
    cruiser = Ship.new("Cruiser", 3)
    expect(cruiser.sunk?).to eq(false)
  end

  it "has a hit method" do
    cruiser = Ship.new("Cruiser", 3)
    cruiser.hit
    expect(cruiser.health).to eq(2)
    cruiser.hit
    expect(cruiser.sunk?).to eq(false)
    expect(cruiser.health).to eq(1)
    cruiser.hit
    expect(cruiser.health).to eq(0)
    expect(cruiser.sunk?).to be (true)
  end

  


end