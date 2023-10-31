class Game
  attr_reader :my_board, :computer_board, :my_cruiser, :my_submarine, :computer_cruiser, :computer_submarine

  def initialize
    @my_board = Board.new
    @computer_board = Board.new
    @my_cruiser = Ship.new("Cruiser", 3)
    @my_submarine = Ship.new("Submarine", 2) 
    @computer_cruiser = Ship.new("Cruiser", 3)
    @computer_submarine = Ship.new("Submarine", 2) 
  end

  # def place_ships(ship, coordinates)
  #   @my_board.place(ship, coordinates)
  # end

  def place_computer_ships
    ## Place Cruiser:
    cruiser_coordinates = []
    
    random_coordinate_1 = @computer_board.random_coordinate
    random_coordinate_2 = @computer_board.random_coordinate
    random_coordinate_3 = @computer_board.random_coordinate

    until @computer_board.valid_placement?(Ship.new("Placeholder Ship",2), [random_coordinate_1, random_coordinate_2])
      random_coordinate_2 = @computer_board.random_coordinate
    end
    
    until @computer_board.valid_placement?(@computer_cruiser, [random_coordinate_1, random_coordinate_2, random_coordinate_3])
      random_coordinate_3 = @computer_board.random_coordinate
    end

    cruiser_coordinates << random_coordinate_1
    cruiser_coordinates << random_coordinate_2
    cruiser_coordinates << random_coordinate_3

    @computer_board.place(@computer_cruiser, cruiser_coordinates)

    ## Place Submarine
    submarine_coordinates = []

    random_coordinate_1 = @computer_board.random_coordinate
    random_coordinate_2 = @computer_board.random_coordinate
    
    until @computer_board.valid_placement?(@computer_submarine, [random_coordinate_1, random_coordinate_2])
      random_coordinate_2 = @computer_board.random_coordinate
    end

    submarine_coordinates << random_coordinate_1
    submarine_coordinates << random_coordinate_2

    @computer_board.place(@computer_submarine, submarine_coordinates)

  end

  def game_over?
    boards = [@my_board, @computer_board]
    boards.each do |board|
      board.cells.all? do |name, cell|
        cell.empty? || cell.ship.sunk?
      end
    end
  end

  def take_turn
    if game_over? == false
      render_game_board
    end
  end

  def render_game_board
    puts "=============COMPUTER BOARD============="
    puts game.computer_board.render
    puts "==============PLAYER BOARD=============="
    puts game.my_board.render(true)
  end

end