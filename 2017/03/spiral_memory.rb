class SpiralMemory
  def initialize(input)
    @input = input
  end

  def manhattan_distance
    half_ring_distance + distance_from_ring_mid_point
  end

  def distance_from_ring_mid_point
    ring_mid_points.map do |mid_point|
      (input - mid_point).abs
    end.min
  end

  def half_ring_distance
    (ring_dimension / 2).floor
  end

  def ring_dimension
    result = Math.sqrt(input).ceil
    return result + 1 if result.even?
    result
  end

  private

  def max_value_in_ring
    ring_dimension * ring_dimension
  end

  def ring_mid_points
    [
      max_value_in_ring - 1 * half_ring_distance,
      max_value_in_ring - 3 * half_ring_distance,
      max_value_in_ring - 5 * half_ring_distance,
      max_value_in_ring - 7 * half_ring_distance,
    ]
  end

  attr_reader :input
end
