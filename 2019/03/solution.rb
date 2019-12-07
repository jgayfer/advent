require 'pry'
class PartOne
  def solve
    build_path_for_wire(1)
    build_path_for_wire(2)

    intersections = paths[1] & paths[2]
  end

  def build_path_for_wire(wire_number)
    paths[wire_number] = [[0,0]]

    operations_for_wire(wire_number).each do |operation|
      add_next_path_for_wire(wire_number, operation)
    end
  end

  def add_next_path_for_wire(wire_number, operation)
    x, y = paths[wire_number].last

    direction = operation[0,1]
    magnitude = operation[1..-1].to_i

    case direction
    when 'U'
      magnitude.times do |m|
        paths[wire_number] << [x, y + (m + 1)]
      end
    when 'R'
      magnitude.times do |m|
        paths[wire_number] << [x + (m + 1), y]
      end
    when 'D'
      magnitude.times do |m|
        paths[wire_number] << [x, y + (m - 1)]
      end
    when 'L'
      magnitude.times do |m|
        paths[wire_number] << [x + (m - 1), y]
      end
    end
  end

  def paths
    @paths ||= {}
  end

  def operations_for_wire(wire_number)
    input_file.lines[wire_number - 1].split(',')
  end

  def input_file
    @input_file ||= File.read('input.txt')
  end
end
