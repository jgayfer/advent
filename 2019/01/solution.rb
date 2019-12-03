class PartOne
  def solve
    module_masses.sum do |mass|
      fuel(mass)
    end
  end

  def fuel(mass)
    mass / 3 - 2
  end

  def module_masses
    input_file.lines.map(&:to_i)
  end

  def input_file
    @input_file ||= File.read('input.txt')
  end
end

class PartTwo < PartOne
  def solve
    module_masses.sum do |mass|
      adjusted_fuel(mass)
    end
  end

  def adjusted_fuel(mass)
    fuel = fuel(mass)
    return 0 if fuel < 0
    fuel + adjusted_fuel(fuel)
  end
end
