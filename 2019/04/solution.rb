class PartOne
  def solve(lower_bound:, upper_bound:)
    (lower_bound..upper_bound).count do |candidate|
      chars = candidate.to_s.chars
      next false if chars.sort != chars
      chars.each_cons(2).any? { |a,b| a == b}
    end
  end
end

class PartTwo
  def solve(lower_bound:, upper_bound:)
    (lower_bound..upper_bound).count do |candidate|
      chars = candidate.to_s.chars
      next false if chars.sort != chars
      chars.chunk { |char| char }.any? { |chunk| chunk[1].length == 2 }
    end
  end
end
