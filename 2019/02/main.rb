require_relative 'computer'

og_input = File.read('input.txt').split(',').map(&:to_i)

puts "--- Part 1 ---"

input = og_input.dup
input[1] = 12
input[2] = 2

computer = Computer.new(input)
computer.compute
puts computer.memory[0]

puts "--- Part 2 ---"

0.upto(99) do |noun|
  0.upto(99) do |verb|
    input = og_input.dup
    input[1] = noun
    input[2] = verb

    computer = Computer.new(input)
    computer.compute

    if computer.memory[0] == 19690720
      break puts 100 * noun + verb
    end
  end
end
