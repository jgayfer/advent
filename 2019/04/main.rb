require_relative 'solution'

password_count_part_one = PartOne.new.solve(
  lower_bound: 178416,
  upper_bound: 676461
)

puts "Part one: #{password_count_part_one}"

password_count_part_two = PartTwo.new.solve(
  lower_bound: 178416,
  upper_bound: 676461
)

puts "Part two: #{password_count_part_two}"
