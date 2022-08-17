# frozen_string_literal: true

# Game of Life
class Table
  def initialize(rows, columns)
    @rows = rows
    @columns = columns
    @table = Array.new(rows) { Array.new(columns) { Cell.new } } # . *
  end

  def print_table
    @rows.times do |row|
      @columns.times do |column|
        @table[row][column].row = row
        @table[row][column].column = column
        print @table[row][column]
      end
      puts
    end
  end

  def table 
    @table
  end
  def table=(table)
    @table=table 
  end
  def to_s
    print_table
    ''
  end
end

# Game of Life
class Cell
  def initialize(state = nil)
    @state = state.nil? ? random_state : state
  end

  def state 
    @state
  end

  def row 
    @row 
  end

  def column
    @column
  end

  def row=(row)
    @row = row
  end

  def column=(column)
    @column = column
  end

  def random_state
    type_of_cell = ['*', '.']
    type_of_cell[rand(2)]
  end

  def to_s
    @state
  end
end

# Game of life
class Game
  def initialize(rows, columns,number_generation)
    @rows = rows
    @columns = columns
    @number_generation =number_generation
    @current_generation = Table.new(@rows, @columns)
    puts @current_generation
    play()
  end

  def rules(cell)
    neighbors_cell = neighbors(cell)
    if cell.to_s == '*' && (neighbors_cell < 2 || neighbors_cell > 3)
      Cell.new('.')
    elsif cell.to_s == '.' && neighbors_cell == 3
      Cell.new('*')
    else
      cell
    end
  end

  def neighbors(cell) 

    neighbors_position = [

      cell.row-1 >= 0 && cell.column-1 >=0 ? @current_generation.table[cell.row - 1][cell.column - 1].state : '', # top left
      cell.row-1 >= 0 ? @current_generation.table[cell.row - 1][cell.column].state : '', # top center
      cell.row-1 >= 0 && cell.column+1 < @columns ? @current_generation.table[cell.row - 1][cell.column + 1].state : '', # top right


      cell.column-1 >=0  ? @current_generation.table[cell.row][cell.column - 1].state : '', # center left
      cell.column+1 < @columns  ? @current_generation.table[cell.row][cell.column + 1].state : '', # center right


      cell.row+1 < @rows && cell.column-1 >= 0  ? @current_generation.table[cell.row + 1][cell.column - 1].state : '',  # bottom left
      cell.row+1 < @rows  ? @current_generation.table[cell.row + 1][cell.column].state : '', # bottom center
      cell.row+1 < @rows && cell.column+1 < @columns ? @current_generation.table[cell.row + 1][cell.column + 1].state : '' # bottom right

    ]

    neighbors_position.count('*')
  end
  def play
    counter = 0
    while counter <= @number_generation do # code to be executed end
        
        @current_generation.table = @current_generation.table.map.each_with_index do |row, i|
            rules_array =[]
            row.each do |cell|
                rules_array<<rules(cell)
            end
            rules_array
        end
        puts @current_generation
  
        counter = counter + 1;
    end
  end

  def next_generation; end
end



print 'Enter the number of rows: '
rows = gets.chomp.to_i
print 'Enter the number of columns: '
columns = gets.chomp.to_i
print 'Enter the number of generation: '
number_generation = gets.chomp.to_i

Game.new(rows, columns, number_generation)
