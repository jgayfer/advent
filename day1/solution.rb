class Solution
  def initialize(input)
    @input = parse_input(input)
  end

  def final_frequency
    @input.sum
  end

  def first_duplicate_frequency
    frequency = 0
    past_frequencies = [frequency]
    loop do
      @input.each do |frequency_change|
        frequency += frequency_change
        return frequency if past_frequencies.include? frequency
        past_frequencies << frequency
      end
    end
  end

  private

  def parse_input(input)
    result = []
    input.lines.each do |line|
      result << line.to_i
    end
    result
  end
end
