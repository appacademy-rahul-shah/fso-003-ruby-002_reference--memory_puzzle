# frozen_string_literal: true

require_relative('card')

class Board
  def initialize(grid_size)
    @grid_size = grid_size
    @grid = Array.new(@grid_size) { Array.new(@grid_size) }
    populate
  end

  def populate
    pairs = []
    pair_count = (@grid_size**2) / 2
    ('A'..'Z').to_a[0...pair_count].each do |char|
      2.times { pairs << char }
    end

    pairs.shuffle!

    row = 0
    col = 0
    while row < @grid_size
      while col < @grid_size
        pos = [row, col]
        self[pos] = Card.new(pairs[@grid_size * row + col])
        col += 1
      end
      col = 0
      row += 1
    end
  end

  def render
    puts '  ' + (0...@grid_size).to_a.join(' ')
    (0...@grid_size).each do |i|
      print i.to_s + ' '
      grid[i].each_with_index do |col, j|
        print col.to_s || ' '
        if j == @grid_size - 1
          print "\n"
        else
          print ' '
        end
      end
    end
  end

  def won?
    row = 0
    col = 0
    while row < @grid_size
      while col < @grid_size
        pos = [row, col]
        return false unless self[pos].face_up

        col += 1
      end
      col = 0
      row += 1
    end
    true
  end

  def [](pos)
    row, col = pos
    grid[row][col]
  end

  def []=(pos, value)
    row, col = pos
    grid[row][col] = value
  end

  private

  attr_accessor :grid
end
