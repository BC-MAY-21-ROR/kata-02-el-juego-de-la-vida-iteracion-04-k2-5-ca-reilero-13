class Table
    def initialize(rows, columns) 
        @rows = rows
        @columns = columns
        @table = Array.new(rows){Array.new(columns){Cell.new().random_state}}
    end

    def print_table
        @rows.times do |row|
            @columns.times do |column|
                print @table[row][column]
            end
            puts 
        end
    end
end

class Cell
    def initialize()
        @state = '.'
        
    end
    def random_state
        type_of_cell =['*','.']
        @state = type_of_cell[rand(2)]

    end
    
end

Table.new(3, 3).print_table