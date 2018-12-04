class Solution
  def initialize(input:, size:)
    @claims = parse_input(input)
    @size = size
    @grid = Array.new(size){Array.new(size, 0)}
    compute_grid
  end

  def claim_with_no_overlap
    @claims.each do |claim|
      unless claim_has_overlap?(claim)
        return claim[0]
      end
    end
  end

  def overlap_count
    @grid.flatten.select { |cell| cell > 1 }.count
  end

  private

  def claim_has_overlap?(claim)
    _, x, y, w, h = claim
    h.times do |height_index|
      w.times do |width_index|
        if @grid[x+width_index][y+height_index] > 1
          return true
        end
      end
    end
    false
  end

  def compute_grid
    @claims.each do |claim|
      _, x, y, w, h = claim
      h.times do |height_index|
        w.times do |width_index|
          @grid[x+width_index][y+height_index] += 1
        end
      end
    end
  end

  def parse_claim(claim)
    /#(\d+) @ (\d+),(\d+): (\d+)x(\d+)/.match(claim)[1..-1].map(&:to_i)
  end

  def parse_input(input)
    result = []
    input.lines.each do |line|
      result << parse_claim(line)
    end
    result
  end
end
