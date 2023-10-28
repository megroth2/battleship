class Board
  attr_reader :cells

  def initialize
    @cells = {
      "A1" => Cell.new("A1"),
      "A2" => Cell.new("A2"),
      "A3" => Cell.new("A3"),
      "A4" => Cell.new("A4"),
      "B1" => Cell.new("B1"),
      "B2" => Cell.new("B2"),
      "B3" => Cell.new("B3"),
      "B4" => Cell.new("B4"),
      "C1" => Cell.new("C1"),
      "C2" => Cell.new("C2"),
      "C3" => Cell.new("C3"),
      "C4" => Cell.new("C4"),
      "D1" => Cell.new("D1"),
      "D2" => Cell.new("D2"),
      "D3" => Cell.new("D3"),
      "D4" => Cell.new("D4")
     }
  end

  def valid_coordinate?(coordinate)
    @cells[coordinate] != nil
  end

  def valid_placement?(ship, coordinates)
    coordinates.count == ship.length && coordinates_are_consecutive?(ship, coordinates) == true
  end

  def coordinates_are_consecutive?(ship, coordinates)
    numbers = []
    letters = []

    coordinates.each do |coordinate|
      numbers << coordinate.chars.last.to_i
      letters << coordinate.chars.first.ord
    end
    
    (letters.each_cons(2).all? {|a, b| b == a } && numbers.each_cons(2).all? {|a, b| b == a + 1 }) || (numbers.each_cons(2).all? {|a, b| b == a } && letters.each_cons(2).all? {|a, b| b == a + 1 })
  end
    
  def place(ship, coordinates)
    if valid_placement?(ship, coordinates)
      coordinates.each do |coordinate|
        @cells[coordinate].place_ship(ship)
      end
    end

  end



end