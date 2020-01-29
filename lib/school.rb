class School
  attr_reader :start_time, :hours_in_school_day, :student_names

  def initialize(start_time, hours_in_school_day)
    @start_time = start_time
    @hours_in_school_day = hours_in_school_day
    @student_names = []
  end

  def add_student_name(name)
    @student_names << name
  end

  def end_time
    end_time = @start_time.delete(':').to_i + (@hours_in_school_day * 100)
    end_time.to_s.insert(-3, ':')
  end

  def is_full_time?
    @hours_in_school_day > 4
  end

  def standard_student_names
    @student_names.map {|name| name.capitalize}
  end

  def convert_end_time_to_clock_time
    time_integer = end_time.delete(':').to_i
    return end_time if time_integer <= 1200
    
    civilian_time = time_integer - 1200
    civilian_time.to_s.insert(-3, ':')
  end
end
