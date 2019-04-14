require_relative 'spiral_memory'
require 'pry'

RSpec.describe SpiralMemory do
  let(:instance) { described_class.new(input) }

  describe '#manhattan_distance' do
    subject { instance.manhattan_distance }

    context 'with an input of 1' do
      let(:input) { 1 }
      it { is_expected.to eq 0 }
    end

    context 'with an input of 12' do
      let(:input) { 12 }
      it { is_expected.to eq 3 }
    end

    context 'with an input of 23' do
      let(:input) { 23 }
      it { is_expected.to eq 2 }
    end

    context 'with an input of 1024' do
      let(:input) { 1024 }
      it { is_expected.to eq 31 }
    end
  end

  describe '#distance_from_ring_mid_point' do
    subject { instance.distance_from_ring_mid_point }

    context 'with an input of 1' do
      let(:input) { 1 }
      it { is_expected.to eq 0 }
    end

    context 'with an input of 2' do
      let(:input) { 2 }
      it { is_expected.to eq 0 }
    end

    context 'with an input of 3' do
      let(:input) { 3 }
      it { is_expected.to eq 1 }
    end

    context 'with an input of 15' do
      let(:input) { 15 }
      it { is_expected.to eq 0 }
    end

    context 'with an input of 25' do
      let(:input) { 25 }
      it { is_expected.to eq 2 }
    end
  end

  describe '#half_ring_distance' do
    subject { instance.half_ring_distance }

    context 'with an input of 1' do
      let(:input) { 1 }
      it { is_expected.to eq 0 }
    end

    context 'with an input of 2' do
      let(:input) { 2 }
      it { is_expected.to eq 1 }
    end

    context 'with an input of 3' do
      let(:input) { 3 }
      it { is_expected.to eq 1 }
    end

    context 'with an input of 10' do
      let(:input) { 10 }
      it { is_expected.to eq 2 }
    end
  end

  describe '#half_ring_distance' do
    subject { instance.half_ring_distance }

    context 'with an input of 1' do
      let(:input) { 1 }
      it { is_expected.to eq 0 }
    end

    context 'with an input of 2' do
      let(:input) { 2 }
      it { is_expected.to eq 1 }
    end

    context 'with an input of 10' do
      let(:input) { 10 }
      it { is_expected.to eq 2 }
    end
  end

  describe '#ring_dimension' do
    subject { instance.ring_dimension }

    context 'with an input of 1' do
      let(:input) { 1 }
      it { is_expected.to eq 1 }
    end

    context 'with an input of 2' do
      let(:input) { 2 }
      it { is_expected.to eq 3 }
    end

    context 'with an input of 3' do
      let(:input) { 9 }
      it { is_expected.to eq 3 }
    end

    context 'with input of 10' do
      let(:input) { 10 }
      it { is_expected.to eq 5 }
    end
  end
end
