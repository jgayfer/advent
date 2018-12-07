require_relative 'solution'
require 'pry'

input = File.read('input.txt')
solution = Solution.new(input)

binding.pry

sleepiest_guard = solution.sleepiest_guard

puts "Answer: #{sleepiest_guard.number.to_i * sleepiest_guard.minute_most_slept_at}"
