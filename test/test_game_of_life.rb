require 'minitest/autorun'
require './game_of_life.rb'

class GameTest < Minitest::Test
    def test_create_Cell
        cell = Cell.new('.')
        assert_equal '.', cell.state 
    end

    def test_create_table
        table = Table.new(3, 3)
        refute_empty table
    end
end

class Game

end