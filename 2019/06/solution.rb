class Planet
  attr_reader :name, :orbits

  def initialize(name:, orbits:)
    @name = name
    @orbits = orbits
  end
end

class PartOne
  def solve
    planets.sum do |planet|
      all_orbits(planet).count
    end
  end

  def all_orbits(planet)
    orbits = []

    while planet&.orbits
      orbits << planet.orbits
      planet = planets.detect { |p| p.name == planet.orbits }
    end

    orbits
  end

  def planets
    @planets ||= begin
      input_file.lines.map do |line|
        orbits, name = line.split(')').map(&:strip)
        Planet.new(name: name, orbits: orbits)
      end
    end
  end

  def input_file
    @input_file ||= File.read('input.txt')
  end
end

class PartTwo < PartOne
  def solve
    you = planets.detect { |p| p.name == 'YOU' }
    san = planets.detect { |p| p.name == 'SAN' }

    you_orbits = all_orbits(you)
    san_orbits = all_orbits(san)

    first_shared_orbit = (you_orbits & san_orbits).first

    you_orbits.find_index(first_shared_orbit) + \
      san_orbits.find_index(first_shared_orbit)
  end
end
