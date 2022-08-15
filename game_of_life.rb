class Table
    def initialize(rows, columns) 
        @rows = rows
        @columns = columns
        @table = Array.new(rows){Array.new(columns){"."}}
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

Table.new(3, 3).print_table