require 'pry'

class PartOne
  def solve
    seat_ids.max
  end

  def seat_ids
    input_file.lines.map { |line| seat_id(line) }
  end

  def row_code(chars)
    chars.map { |c| c == 'F' ? true : false }.reverse
  end

  def column_code(chars)
    chars.map { |c| c == 'L' ? true : false }.reverse
  end

  def row_id(chars)
    find(code: row_code(chars), upper: 127, lower: 0)
  end

  def column_id(chars)
    find(code: column_code(chars), upper: 7, lower: 0)
  end

  def seat_id(input)
    column_id(input.chars[7..9])
    row_id(input.chars[0..6]) * 8 + column_id(input.chars[7..9])
  end

  def find(code:, upper:, lower:)
    diff = upper - lower

    if code.length == 1
      return code.pop ? lower : upper
    end

    if code.pop
      find(code: code, upper: upper - diff / 2 - 1, lower: lower)
    else
      find(code: code, upper: upper, lower: lower + diff / 2 + 1)
    end
  end

  def input_file
    @input_file ||= File.read('input.txt')
  end
end

class PartTwo < PartOne
  def solve
    ((seat_ids.first..seat_ids.last).to_a - seat_ids).first
  end
end
