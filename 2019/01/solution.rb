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
