require_relative 'solution'

part_one = PartOne.new.solve(
  Slope.new(right: 3, down: 1)
)

part_two = PartTwo.new.solve(
  [
    Slope.new(right: 1, down: 1),
    Slope.new(right: 3, down: 1),
    Slope.new(right: 5, down: 1),
    Slope.new(right: 7, down: 1),
    Slope.new(right: 1, down: 2)
  ]
)

puts "Part one: #{part_one}"
puts "Part two: #{part_two}"

