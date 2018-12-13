require 'date'

class Solution
  def initialize(input)
    parse_events(input)
  end

  def sleepiest_guard
    @guards.max_by { |k, v| v.sum }.first
  end

  def sleepiest_minute(guard)
    @guards[guard].index(@guards[guard].max)
  end

  private

  def parse_events(input)
    @guards = Hash.new { |h, k| h[k] = Array.new(60) { 0 } }

    current_guard = nil
    sleep_start = nil

    input.lines.sort.each do |event|
      _, date_time, event = /\[(.*?)\] (.*?)$/.match(event).to_a
      date_time = DateTime.parse(date_time)

      case event
      when /Guard #(\d+) begins shift/
        current_guard = Regexp.last_match[1].to_i
      when /falls asleep/
        sleep_start = date_time.min
      when /wakes up/
        sleep_end = date_time.min
        sleep_start.upto(sleep_end - 1) do |minute|
          @guards[current_guard][minute] += 1
        end
      end
    end
  end
end
