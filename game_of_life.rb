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

Table.new(3, 3).print_table