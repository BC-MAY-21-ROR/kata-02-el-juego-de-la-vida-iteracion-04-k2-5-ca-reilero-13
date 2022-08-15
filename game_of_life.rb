class Table
    def initialize(rows, columns) 
        @rows = rows
        @columns = columns
        @table = Array.new(rows){Array.new(columns){Cell.new()}} #. *
    end

    def print_table
        @rows.times do |row|
            @columns.times do |column|
                print @table[row][column]
            end
            puts 
        end
    end

    def to_s
     return  print_table
    end
end
class Cell
    def initialize(state=nil)
    
        @state = state.nil? ? random_state : state
    end
    def random_state
        type_of_cell =['*','.']
        type_of_cell[rand(2)]

    end
    def to_s
        @state
    end
end

class Game
    def initialize
        puts 'ingrese filas'
        @rows=gets.chomp.to_i
        puts 'ingrese columnas'
        @columns=gets.chomp.to_i
        @current_generation =  Table.new(@rows, @columns)
    end

    def rules(cell)

    end

    def next_generation
    end
end
print Table.new(3, 3)
