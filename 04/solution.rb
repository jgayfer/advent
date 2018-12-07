require 'date'

class Solution
  attr_reader :guards

  def initialize(input)
    events = build_events(input)
    @guards = build_guards(events)
  end

  def sleepiest_guard
    current_sleepiest_guard = nil
    most_minutes_slept = 0
    @guards.each do |guard|
      if guard.total_minutes_asleep > most_minutes_slept
        current_sleepiest_guard = guard
        most_minutes_slept = guard.total_minutes_asleep
      end
    end
    current_sleepiest_guard
  end

  private

  def build_event(input)
    extracted_values = /\[(.*?)\] (.*?)$/.match(input)
    date = DateTime.parse(extracted_values[1])
    action = extracted_values[2]
    Event.new(date: date, action: action)
  end

  def build_events(input)
    events = []
    input.lines.sort.each do |line|
      events << build_event(line)
    end
    events
  end

  def build_guards(events)
    guards = []
    current_guard = nil
    current_shift = nil
    events.each do |event|
      if event.action == "falls asleep"
        (60 - event.date.minute.to_i).times do |index|
          current_shift.minutes[event.date.minute + index] = "X"
        end
      elsif event.action ==  "wakes up"
        (60 - event.date.minute.to_i).times do |index|
          current_shift.minutes[event.date.minute + index] = "."
        end
      else
        guard_number = /#(.*?) /.match(event.action)[1]
        guard = guards.find { |guard| guard.number == guard_number }
        if !guard
          guard = Guard.new(guard_number)
          guards << guard
        end
        shift = Shift.new
        guard.shifts << shift
        current_shift = shift
        current_guard = guard
      end
    end
    guards
  end
end

class Event
  attr_reader :date, :action

  def initialize(date:, action:)
    @date = date
    @action = action
  end
end

class Guard
  attr_reader :number
  attr_accessor :shifts

  def initialize(number)
    @number = number
    @shifts = []
  end

  def total_minutes_asleep
    @shifts.map(&:minutes).flatten.count('X')
  end

  def minute_most_slept_at
    @shifts.map(&:minutes).transpose.each_with_index.max[1]
  end
end

class Shift
  attr_accessor :minutes

  def initialize
    @minutes = Array.new(60, '.')
  end
end
