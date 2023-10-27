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
    @status != "."
  end

  def fire_upon
    
    if empty?
      @status = "M"
    elsif !empty? && @ship.health != 0
      @status = "H" && @ship.health -= 1
    else !empty? && @ship.health == 0
      @status = "X"
    end
  end

end