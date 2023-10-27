class Cell

  attr_reader :coordinate,
              :ship,
              :status

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
      @status = "H"
      @ship.hit
    else !empty? && @ship.sunk?
      @status = "X"
    end
  end

  def render(word = false)
    if word == true && !empty?
      return "S"
    else
    @status
    end
  end





end