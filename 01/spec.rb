require_relative 'solution'

RSpec.describe Solution do
  let(:input) do
    <<~INPUT
      +1
      -2
      +3
      +1
    INPUT
  end

  let(:solution) { Solution.new(input) }

  describe '#final_frequency' do
    subject { solution.final_frequency }
    it { is_expected.to eq 3 }
  end

  describe '#first_duplicate_frequency' do
    subject { solution.first_duplicate_frequency }

    context "test case 1" do
      let(:input) do
        <<~INPUT
          +1
          -1
        INPUT
      end
      it { is_expected.to eq 0 }
    end

    context "test case 2" do
      let(:input) do
        <<~INPUT
          +3
          +3
          +4
          -2
          -4
        INPUT
      end
      it { is_expected.to eq 10 }
    end
  end
end
