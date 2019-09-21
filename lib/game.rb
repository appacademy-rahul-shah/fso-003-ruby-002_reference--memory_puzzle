# frozen_string_literal: true

require_relative('board')
require_relative('card')
require_relative('player')

class Game
  def initialize(board, player)
    @board = board
    @previous_guess = nil
    @player = player
  end

  def play
    until @board.won?
      2.times do
        render_board
        @player.prompt
        guessed_pos = @player.input
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

  def render_board(guess = nil)
    @board[guess].reveal if guess
    system('clear')
    @board.render
  end
end

if $PROGRAM_NAME == __FILE__
  game = Game.new(Board.new, HumanPlayer.new)
  game.play
end
