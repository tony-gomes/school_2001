require 'minitest/autorun'
require 'minitest/pride'
require './lib/school'

class SchoolTest < Minitest::Test

  def setup
    @school = School.new('9:00', 7)
  end

  def test_it_exists
    assert_instance_of School, @school
  end

  def test_it_has_start_time
    assert_equal '9:00', @school.start_time
  end

  def test_it_has_hours_in_school_day
    assert_equal 7, @school.hours_in_school_day
  end

  def test_it_starts_with_no_student_names
    assert_equal [], @school.student_names
  end

  def test_it_can_add_student_names
    @school.add_student_name('Aurora')
    @school.add_student_name('tim')
    @school.add_student_name('megan')

    assert_equal ['Aurora', 'tim', 'megan'], @school.student_names
  end

  def test_it_can_calculate_end_time
    school2 = School.new('9:00', 3)

    assert_equal '16:00', @school.end_time
    assert_equal '12:00', school2.end_time
  end

  def test_is_full_time_method
    assert @school.is_full_time?
  end

  def test_add_student_name_method
    @school.add_student_name('Aurora')
    @school.add_student_name('tim')
    @school.add_student_name('megan')

    assert_equal ["Aurora", "Tim", "Megan"], @school.standard_student_names
  end

  def test_convert_end_time_to_clock_time
    assert_equal '4:00', @school.convert_end_time_to_clock_time
  end
end
