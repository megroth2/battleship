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

  ## place ships
  def place_ships(ship, coordinates)
    @my_board.place(ship, coordinates)
  end


  # generate random coordinates
  # check if each coordinate is valid

  # check if multiple coordinates are valid together
  # add to an array and place ship

  def place_computer_ships(ship)
    temp_ship = Ship.new("Temp",2)
    cruiser_coordinates = []
    
    random_coordinate_1 = @computer_board.random_coordinate
    random_coordinate_2 = @computer_board.random_coordinate
    random_coordinate_3 = @computer_board.random_coordinate

    until @computer_board.valid_placement?(temp_ship, [random_coordinate_1, random_coordinate_2])
      random_coordinate_2 = @computer_board.random_coordinate
    end
    
    until @computer_board.valid_placement?(ship, [random_coordinate_1, random_coordinate_2, random_coordinate_3])
      random_coordinate_3 = @computer_board.random_coordinate
    end

    cruiser_coordinates << random_coordinate_1
    cruiser_coordinates << random_coordinate_2
    cruiser_coordinates << random_coordinate_3

    @computer_board.place(@computer_cruiser, cruiser_coordinates)


  end

  ## is the game over?

  def game_over?
    boards = [@my_board, @computer_board]
      boards.each do |board|
        board.cells.all? do |name, cell|
          cell.ship.sunk? if !cell.empty?
        end
      end
    end



  def game_play
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