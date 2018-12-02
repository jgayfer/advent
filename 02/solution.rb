class Solution
  def initialize(input)
    @input = parse_input(input)
  end

  def double_count
    count = 0
    @input.each do |input|
      count += 1 if contains_double? input
    end
    count
  end

  def triple_count
    count = 0
    @input.each do |input|
      count += 1 if contains_triple? input
    end
    count
  end

  def checksum
    double_count * triple_count
  end

  def correct_box_ids
    @input.each do |input1|
      @input.each do |input2|
        if inputs_differ_by_one_at_same_index?(input1, input2)
          return [input1, input2]
        end
      end
    end
  end

  def correct_box_ids_common_letters
    box_id_1, box_id_2 = correct_box_ids
    common_letters = ""
    box_id_1.length.times do |index|
      if box_id_1[index] == box_id_2[index]
        common_letters << box_id_1[index]
      end
    end
    common_letters
  end

  private

  def inputs_differ_by_one_at_same_index?(input1, input2)
    differences_at_same_index = 0
    input1.length.times do |index|
      if input1[index] != input2[index]
        differences_at_same_index += 1
      end
    end
    differences_at_same_index == 1
  end

  def contains_double?(input)
    input.each_char do |c|
      return true if input.count(c) == 2
    end
    false
  end

  def contains_triple?(input)
    input.each_char do |c|
      return true if input.count(c) == 3
    end
    false
  end

  def parse_input(input)
    result = []
    input.lines.each do |line|
      result << line.strip
    end
    result
  end
end
