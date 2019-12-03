class PartOne
  def solve(input)
    input.lines.map(&:to_i).sum do |entry|
      entry / 3 - 2
    end
  end
end
