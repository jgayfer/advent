class PartOne
  def solve
    input_file.lines.count do |line|
      min, max, seq, password =
        line.match(/(\d+)-(\d+) ([a-zA-Z]+): ([a-zA-Z]+)/).captures
      password.count(seq).between?(min.to_i, max.to_i)
    end
  end

  def input_file
    @input_file ||= File.read('input.txt')
  end
end

class PartTwo < PartOne
  def solve
    input_file.lines.count do |line|
      first, second, seq, password =
        line.match(/(\d+)-(\d+) ([a-zA-Z]+): ([a-zA-Z]+)/).captures
      (password[first.to_i - 1] == seq) ^ (password[second.to_i - 1] == seq)
    end
  end
end
