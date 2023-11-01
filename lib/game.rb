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

  def play(input)
    if input == "p"
      setup_boards
      until game_over?
        take_turn
      end
    end_game
    elsif input == "q"
    end
  end
  
  def place_computer_ships
    ## Place Cruiser:
    random_coordinate_1 = @computer_board.random_coordinate
    random_coordinate_2 = @computer_board.random_coordinate
    random_coordinate_3 = @computer_board.random_coordinate

    until @computer_board.valid_placement?(Ship.new("Placeholder Ship",2), [random_coordinate_1, random_coordinate_2])
      random_coordinate_2 = @computer_board.random_coordinate
    end
    
    until @computer_board.valid_placement?(@computer_cruiser, [random_coordinate_1, random_coordinate_2, random_coordinate_3])
      random_coordinate_3 = @computer_board.random_coordinate
    end

    cruiser_coordinates = []
    cruiser_coordinates << random_coordinate_1
    cruiser_coordinates << random_coordinate_2
    cruiser_coordinates << random_coordinate_3

    @computer_board.place(@computer_cruiser, cruiser_coordinates)

    ## Place Submarine
    random_coordinate_1 = @computer_board.random_coordinate
    random_coordinate_2 = @computer_board.random_coordinate
    
    until @computer_board.valid_placement?(@computer_submarine, [random_coordinate_1, random_coordinate_2])
      random_coordinate_2 = @computer_board.random_coordinate
    end

    submarine_coordinates = []
    submarine_coordinates << random_coordinate_1
    submarine_coordinates << random_coordinate_2

    @computer_board.place(@computer_submarine, submarine_coordinates)
  end

  def setup_boards
    place_computer_ships
      
    puts "I have laid out my ships on the grid."
    puts "You now need to lay out your two ships."
    puts "The Cruiser is three units long and the Submarine is two units long."
    puts @my_board.render(true)
    puts "Enter the squares for the Cruiser (one space at a time):"
        
    cruiser_coordinates = []
    cruiser_coordinates << gets.chomp
    cruiser_coordinates << gets.chomp
    cruiser_coordinates << gets.chomp
      
    until @my_board.valid_placement?(@my_cruiser, cruiser_coordinates)
      puts "Those are invalid coordinates. Please try again:"
      cruiser_coordinates = []
      cruiser_coordinates << gets.chomp
      cruiser_coordinates << gets.chomp
      cruiser_coordinates << gets.chomp
    end
    @my_board.place(@my_cruiser, cruiser_coordinates)
        
    puts @my_board.render(true)
    puts "Enter the squares for the Submarine (one space at a time):"
  
    submarine_coordinates = []
    submarine_coordinates << gets.chomp
    submarine_coordinates << gets.chomp
  
    until @my_board.valid_placement?(@my_submarine, submarine_coordinates)
      puts "Those are invalid coordinates. Please try again:"
      submarine_coordinates = []
      submarine_coordinates << gets.chomp
      submarine_coordinates << gets.chomp
    end
    @my_board.place(@my_submarine, submarine_coordinates)
  end

  def render_game_boards
    puts "=============COMPUTER BOARD============="
    puts @computer_board.render
    puts "==============PLAYER BOARD=============="
    puts @my_board.render(true)
    puts ()
  end

  def take_turn
    render_game_boards
    puts "Enter the coordinate for your shot:"
    turn_coordinate = gets.chomp
    until @computer_board.valid_coordinate?(turn_coordinate)
      puts "Please enter a valid coordinate:" 
      turn_coordinate = gets.chomp
    end
    puts()
    puts "===================================================="
    puts()
    puts "You've already fired upon this cell." if @computer_board.cells[turn_coordinate].fired_upon?
    until @computer_board.valid_coordinate?(turn_coordinate) && !@computer_board.cells[turn_coordinate].fired_upon?
      puts "Please enter a valid coordinate:"
      turn_coordinate = gets.chomp
    end
    @computer_board.cells[turn_coordinate].fire_upon

    computer_guess = @my_board.random_coordinate
    while @my_board.cells[computer_guess].fired_upon?
      computer_guess = @my_board.random_coordinate
    end
    @my_board.cells[computer_guess].fire_upon


    if @computer_board.cells[turn_coordinate].status == "M"
      puts "Your shot on #{turn_coordinate} was a miss."
      puts()
    elsif @computer_board.cells[turn_coordinate].status == "H"
      puts "Your shot on #{turn_coordinate} was a hit."
      puts()
    elsif @computer_board.cells[turn_coordinate].status == "X"
      puts "Your shot on #{turn_coordinate} was a hit."
      puts "The ship was sunk."
      puts()
    end

    if @my_board.cells[computer_guess].status == "M"
      puts "My shot on #{computer_guess} was a miss."
      puts()
    elsif @my_board.cells[computer_guess].status == "H"
      puts "My shot on #{computer_guess} was a hit."
      puts()
    elsif @my_board.cells[computer_guess].status == "X"
      puts "My shot on #{computer_guess} was a hit."
      puts "The ship was sunk."
      puts()
    end
  end

  def game_over?
    @my_board_status = @my_board.cells.all? do |name, cell|
      cell.empty? || cell.ship.sunk?
    end
    
    @computer_board_status = @computer_board.cells.all? do |name, cell|
      cell.empty? || cell.ship.sunk?
    end

    @my_board_status || @computer_board_status
  end

  def end_game
    render_game_boards
    if game_over? && @my_board_status
      puts "I won!"
      puts ()
    else game_over? && @computer_board_status
      puts "You won!"
      puts ()
    end
  end

end