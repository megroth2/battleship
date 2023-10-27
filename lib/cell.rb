class Cell

  attr_reader :coordinate,
              :ship

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    @status = "."
  end

  def empty?
    @ship == nil
  end

  def place_ship(ship)
    @ship = ship
  end

  def fired_upon?
    @ship.health != @ship.length
  end

  def fire_upon
    status = "M" if ship = nil
    status = "H" && @ship.health -= 1 if ship != nil
    status = "X" if @ship.health == 0
  end

end