class PartOne
  class OpcodeError < StandardError; end

  OP_CODE_LENGTH = 4

  def solve
    input[1] = 12
    input[2] = 2

    opcodes.each do |opcode|
      if opcode.first == 1
        input[opcode[3]] = input[opcode[1]] + input[opcode[2]]
      elsif opcode.first == 2
        input[opcode[3]] = input[opcode[1]] * input[opcode[2]]
      elsif opcode.first == 99
        break
      else
        raise OpcodeError
      end
    end

    input.first
  end

  def opcodes
    input.each_slice(OP_CODE_LENGTH).to_a
  end

  def input
    @input ||= input_file.split(',').map(&:to_i)
  end

  def input_file
    @input_file ||= File.read('input.txt')
  end
end
