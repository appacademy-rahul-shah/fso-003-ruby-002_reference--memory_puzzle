# frozen_string_literal: true

class HumanPlayer
  def prompt
    puts "Enter [row,column] position of the card to flip (e.g. '2,3'):"
  end

  def input
    gets.chomp.split(',').map!(&:to_i)
  end
end
