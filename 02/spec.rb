require_relative 'solution'

RSpec.describe Solution do
  let(:solution) { Solution.new(input) }

  context "part one" do
    let(:input) do
      <<~INPUT
        abcdef
        bababc
        abbcde
        abcccd
        aabcdd
        abcdee
        ababab
      INPUT
    end

    describe '#double_count' do
      subject { solution.double_count }
      it { is_expected.to eq 4 }
    end

    describe '#triple_count' do
      subject { solution.triple_count }
      it { is_expected.to eq 3 }
    end

    describe '#checksum' do
      subject { solution.checksum }
      it { is_expected.to eq 12 }
    end
  end

  context "part two" do
    let(:input) do
      <<~INPUT
        abcde
        fghij
        klmno
        pqrst
        fguij
        axcye
        wvxyz
      INPUT
    end

    describe '#correct_box_ids' do
      subject { solution.correct_box_ids }
      it { is_expected.to eq ["fghij", "fguij"] }
    end

    describe '#correct_box_ids_common_letters' do
      subject { solution.correct_box_ids_common_letters }
      it { is_expected.to eq "fgij" }
    end
  end
end
