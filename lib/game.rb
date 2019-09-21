# frozen_string_literal: true

require_relative('board')
require_relative('card')

class Game
  def initialize(board)
    @board = board
  end

  def play
    until @board.won?
      render_board
      guessed_pos1 = prompt
      render_board(@board[guessed_pos1])
      guessed_pos2 = prompt
      render_board(@board[guessed_pos2])
      make_guess(@board[guessed_pos1], @board[guessed_pos2])
    end
    render_board
    puts 'You win!'
  end

  def make_guess(guess1, guess2)
    if guess1 == guess2
      puts "It's a match!"
      sleep(1.5)
    else
      guess1.hide
      guess2.hide
      puts 'Try again...'
      sleep(3)
    end
  end

  def prompt
    puts "Enter [row,column] position of the card to flip (e.g. '2,3'):"
    gets.chomp.split(',').map!(&:to_i)
  end

  def render_board(guess = nil)
    guess&.reveal
    system('clear')
    @board.render
  end
end

if $PROGRAM_NAME == __FILE__
  game = Game.new(Board.new)
  game.play
end
