require_relative 'solution'

RSpec.describe Solution do
  let(:solution) { Solution.new(input: input, size: 8) }

  let(:input) do
    <<~INPUT
      #1 @ 1,3: 4x4
      #2 @ 3,1: 4x4
      #3 @ 5,5: 2x2
    INPUT
  end

  describe '#overlap_count' do
    subject { solution.overlap_count }
    it { is_expected.to eq 4 }
  end

  describe '#claim_with_no_overlap' do
    subject { solution.claim_with_no_overlap }
    it { is_expected.to eq 3 }
  end
end
