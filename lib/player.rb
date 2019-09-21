# frozen_string_literal: true

class HumanPlayer
  def prompt
    puts "Enter [row,column] position of the card to flip (e.g. '2,3'):"
  end

  def input
    gets.chomp.split(',').map!(&:to_i)
  end
end

class ComputerPlayer
  def initialize(grid_size)
    @known_cards = {}
    @grid_size = grid_size
  end

  def prompt
    puts "Enter [row,column] position of the card to flip (e.g. '2,3'):"
  end

  def input
    row = rand(@grid_size)
    col = rand(@grid_size)
    puts "#{row},#{col}"
    [row, col]
  end
end
