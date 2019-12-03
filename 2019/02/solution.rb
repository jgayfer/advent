class PartOne
  class OpcodeError < StandardError; end

  OP_CODE_LENGTH = 4

  def solve
    memory[1] = 12
    memory[2] = 2

    process_opcodes

    memory.first
  end

  def process_opcodes
    opcodes.each do |opcode|
      if opcode.first == 1
        memory[opcode[3]] = memory[opcode[1]] + memory[opcode[2]]
      elsif opcode.first == 2
        memory[opcode[3]] = memory[opcode[1]] * memory[opcode[2]]
      elsif opcode.first == 99
        break
      else
        raise OpcodeError
      end
    end
  end

  def opcodes
    memory.each_slice(OP_CODE_LENGTH).to_a
  end

  def memory
    @memory ||= input.dup
  end

  def input
    input_file.split(',').map(&:to_i)
  end

  def input_file
    @input_file ||= File.read('input.txt')
  end
end

class PartTwo < PartOne
  class NoSolutionError < StandardError; end

  def solve
    0.upto(99) do |noun|
      0.upto(99) do |verb|
        reset_memory
        memory[1] = noun
        memory[2] = verb
        process_opcodes
        return 100 * noun + verb if memory.first == 19690720
      end
    end

    raise NoSolutionError
  end

  def reset_memory
    @memory = input.dup
  end
end
