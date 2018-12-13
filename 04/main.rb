require_relative 'solution'

input = File.read('input.txt')
solution = Solution.new(input)

sleepiest_guard = solution.sleepiest_guard
minute_most_slept = solution.sleepiest_minute(sleepiest_guard)

puts "Sleepiest guard: #{sleepiest_guard}"
puts "Sleepiest minute: #{minute_most_slept}"
puts "Part 1 Solution: #{sleepiest_guard * minute_most_slept}"
