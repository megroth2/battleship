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
    elsif !empty? && @ship.health > 1
      @status = "H"
      @ship.hit
    else !empty? && @ship.health = 1
      @status = "X"
      @ship.hit
    end
  end

  def render(word = false)
    @status = "X" if !empty? && @ship.sunk?
    if word == true && !empty? && !fired_upon?
      return "S"
    else
    @status
    end
  end


end