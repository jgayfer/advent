class PartOne
  def solve(slope)
    x, y = [0, 0]
    trees = 0

    loop do
      x += slope.right
      y += slope.down

      break if y >= input_file.lines.count

      trees += 1 if tree?(x, y)
    end

    trees
  end

  def tree?(x, y)
    input_file.lines[y][x % width] == '#'
  end

  def width
    input_file.lines.first.length - 1
  end

  def input_file
    @input_file ||= File.read('input.txt')
  end
end

class PartTwo < PartOne
  def solve(slopes)
    slopes.map { |slope| super(slope) }.inject(:*)
  end
end

class Slope
  attr_reader :right, :down

  def initialize(right:, down:)
    @right = right
    @down = down
  end
end
