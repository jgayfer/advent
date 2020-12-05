require 'dry-validation'

class PartOne
  def solve
    input_file.split("\n\n").count do |passport|
      ["byr", "iyr", "eyr", "hgt", "hcl", "ecl", "pid"].all? do |attr|
        passport.include? attr
      end
    end
  end

  def input_file
    @input_file ||= File.read('input.txt')
  end
end

class PartTwo < PartOne
  def solve
    input_file.split("\n\n").count do |input|
      PassportContract.new.(
        birth_year: input[/byr:([^\s]+)/, 1],
        issue_year: input[/iyr:([^\s]+)/, 1],
        exp_year: input[/eyr:([^\s]+)/, 1],
        height: input[/hgt:([^\s]+)/, 1],
        hair_color: input[/hcl:([^\s]+)/, 1],
        eye_color: input[/ecl:([^\s]+)/, 1],
        passport_id: input[/pid:([^\s]+)/, 1]
      ).success?
    end
  end
end

class PassportContract < Dry::Validation::Contract
  params do
    required(:birth_year).filled(:integer).value(gteq?: 1920, lteq?: 2002)
    required(:issue_year).filled(:integer).value(gteq?: 2010, lteq?: 2020)
    required(:exp_year).filled(:integer).value(gteq?: 2020, lteq?: 2030)
    required(:height).filled(:string)
    required(:hair_color).filled(:string)
    required(:eye_color).filled(:string).value(included_in?: %w[amb blu brn gry grn hzl oth])
    required(:passport_id).filled(:string)
  end

  rule(:height) do
    key.failure('invalid height') unless (
      value[/(\d+)cm/, 1].to_i.between?(150, 193) ||
      value[/(\d+)in/, 1].to_i.between?(59, 76)
    )
  end

  rule(:hair_color) do
    key.failure('invalid hair color') unless value.match?(/#[0-9a-f]{6}/)
  end

  rule(:passport_id) do
    key.failure('invalid pid') unless value.match?(/^[0-9]{9}$/)
  end
end
