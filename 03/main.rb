require_relative 'solution'

input = File.read('input.txt')
solution = Solution.new(input: input, size: 1000)

puts "Overlap count: #{solution.overlap_count}"
puts "Claim with no overlap: #{solution.claim_with_no_overlap}"

