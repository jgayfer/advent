class PartOne
  def solve
    entries.combination(2) do |a, b|
      return a * b if a + b == 2020
    end
  end

  private

  def entries
    @entries ||= input_file.lines.map(&:to_i)
  end

  def input_file
    @input_file ||= File.read('input.txt')
  end
end

class PartTwo < PartOne
  def solve
    entries.combination(3) do |a, b, c|
      return a * b * c if a + b + c == 2020
    end
  end
end
