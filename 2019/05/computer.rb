class Computer
  attr_reader :memory, :curr_address

  def initialize(memory)
    @memory = memory
    @curr_address = 0
  end

  def compute
    loop do
      case @memory[@curr_address]
      when 1
        perform_addition
        @curr_address += 4
      when 2
        perform_multiplication
        @curr_address += 4
      when 99
        return
      else
        raise StandardError, "Unknown Instruction"
      end
    end
  end

  private

  def perform_addition
    opcode = @memory.slice(@curr_address, @curr_address + 4)
    @memory[opcode[3]] = @memory[opcode[1]] + @memory[opcode[2]]
  end

  def perform_multiplication
    opcode = @memory.slice(@curr_address, @curr_address + 4)
    @memory[opcode[3]] = @memory[opcode[1]] * @memory[opcode[2]]
  end
end
