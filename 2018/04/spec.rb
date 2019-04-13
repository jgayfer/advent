require_relative 'solution'

RSpec.describe Solution do
  let(:solution) { Solution.new(input) }

  let(:input) do
    <<~INPUT
      [1518-11-01 00:00] Guard #10 begins shift
      [1518-11-01 00:05] falls asleep
      [1518-11-01 00:25] wakes up
      [1518-11-01 00:30] falls asleep
      [1518-11-01 00:55] wakes up
      [1518-11-01 23:58] Guard #99 begins shift
      [1518-11-02 00:40] falls asleep
      [1518-11-02 00:50] wakes up
      [1518-11-03 00:05] Guard #10 begins shift
      [1518-11-03 00:24] falls asleep
      [1518-11-03 00:29] wakes up
      [1518-11-04 00:02] Guard #99 begins shift
      [1518-11-04 00:36] falls asleep
      [1518-11-04 00:46] wakes up
      [1518-11-05 00:03] Guard #99 begins shift
      [1518-11-05 00:45] falls asleep
      [1518-11-05 00:55] wakes up
    INPUT
  end

  describe '' do
    subject { solution }
  end

  describe '#sleepiest_guard' do
    subject { solution.sleepiest_guard }
    it { is_expected.to eq 10 }
  end

  describe '#sleepiest_minute' do
    subject { solution.sleepiest_minute(guard) }

    let(:guard) { 10 }

    it { is_expected.to eq 24 }
  end
end

