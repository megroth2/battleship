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
    coordinates.all? { |coordinate| @cells[coordinate].empty? } && coordinates.count == ship.length && coordinates_are_consecutive?(ship, coordinates) == true
  end

  def coordinates_are_empty?(coordinates)
    coordinates.all? {|coordinate| @cells[coordinate].empty?}
  end

  def coordinates_are_consecutive?(ship, coordinates)
    numbers = []
    letters = []

    coordinates.each do |coordinate|
      numbers << coordinate.chars.last.to_i
      letters << coordinate.chars.first.ord
    end
    
    (letters.sort.each_cons(2).all? {|a, b| b == a } && numbers.sort.each_cons(2).all? {|a, b| b == a + 1 }) || (numbers.sort.each_cons(2).all? {|a, b| b == a } && letters.sort.each_cons(2).all? {|a, b| b == a + 1 })
  end
    
  def place(ship, coordinates)
    if valid_placement?(ship, coordinates)
      coordinates.each do |coordinate|
        @cells[coordinate].place_ship(ship)
        true
      end
    end
  end

  def render(word = false)
    "  1 2 3 4 \n" +
    "A #{@cells["A1"].render(word)} #{@cells["A2"].render(word)} #{@cells["A3"].render(word)} #{@cells["A4"].render(word)} \n" + 
    "B #{@cells["B1"].render(word)} #{@cells["B2"].render(word)} #{@cells["B3"].render(word)} #{@cells["B4"].render(word)} \n" +
    "C #{@cells["C1"].render(word)} #{@cells["C2"].render(word)} #{@cells["C3"].render(word)} #{@cells["C4"].render(word)} \n" +
    "D #{@cells["D1"].render(word)} #{@cells["D2"].render(word)} #{@cells["D3"].render(word)} #{@cells["D4"].render(word)} \n"
  end

  def random_coordinate
    coordinate = ""
    until valid_coordinate?(coordinate)
      coordinate = @cells.keys.sample
    end
    coordinate
  end 

end