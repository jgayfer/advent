class PartOne
  def solve
    groups.sum do |group|
      group.tr("\n", '').chars.uniq.count
    end
  end

  def groups
    input_file.split("\n\n")
  end

  def input_file
    @input_file ||= File.read('input.txt')
  end
end

class PartTwo < PartOne
  def solve
    groups.sum do |group|
      group_size = group.lines.count
      group.tr("\n", '').chars.group_by { |c| c }.filter { |k, v| v.to_a.count == group_size }.count
    end
  end
end
