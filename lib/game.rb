# frozen_string_literal: true

require_relative('board')
require_relative('card')

class Game
  def initialize(board)
    @board = board
    @previous_guess = nil
  end

  def play
    until @board.won?
      2.times do
        render_board
        prompt
        guessed_pos = input
        render_board(guessed_pos)
        make_guess(guessed_pos)
      end
      @previous_guess = nil
    end
    render_board
    puts 'You win!'
  end

  def make_guess(pos)
    if @previous_guess
      if @board[pos] == @board[@previous_guess]
        puts "It's a match!"
        sleep(1)
      else
        @board[pos].hide
        @board[@previous_guess].hide
        puts 'Try again...'
        sleep(3)
      end
    else
      @previous_guess = pos
    end
  end

  def prompt
    puts "Enter [row,column] position of the card to flip (e.g. '2,3'):"
  end

  def input
    gets.chomp.split(',').map!(&:to_i)
  end

  def render_board(guess = nil)
    @board[guess].reveal if guess
    system('clear')
    @board.render
  end
end

if $PROGRAM_NAME == __FILE__
  game = Game.new(Board.new)
  game.play
end
