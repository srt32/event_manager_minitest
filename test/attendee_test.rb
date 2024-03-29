require 'minitest'
require 'minitest/autorun'
require './lib/attendee'
require './lib/attendee_data_import'

class AttendeeTest < MiniTest::Test

  def test_it_exists
    attendee = Attendee.new
    assert_kind_of Attendee, attendee
  end

  def test_it_is_initialized_from_a_hash_of_data
    data = {:first_name => 'George', :last_name => 'Washington', :phone_number => '2024556677', :zip_code => '12345'}
    attendee = Attendee.new(data)
    assert_equal data[:first_name], attendee.first_name
    assert_equal data[:last_name], attendee.last_name
    assert_equal data[:phone_number], attendee.phone_number
    assert_equal data[:zip_code], attendee.zip_code
  end

  def test_it_can_change_first_name
    data = {:first_name => "George"}
    attendee = Attendee.new(data)
    assert_equal data[:first_name], attendee.first_name
    attendee.first_name = "Thomas"
    assert_equal "Thomas", attendee.first_name
  end

  def test_it_can_change_last_name
    data = {:last_name => "Washington"}
    attendee = Attendee.new(data)
    assert_equal data[:last_name], attendee.last_name
    attendee.last_name = "Franklin"
    assert_equal "Franklin", attendee.last_name
  end

  def test_it_can_change_phone_number
    data = {:phone_number => "2024556677"}
    attendee = Attendee.new(data)
    assert_equal data[:phone_number], attendee.phone_number
    attendee.phone_number = "1231234567"
    assert_equal "1231234567", attendee.phone_number
  end

  def test_it_can_change_zip_code
    data = {:zip_code => "12345"}
    attendee = Attendee.new(data)
    assert_equal data[:zip_code], attendee.zip_code
    attendee.zip_code = "54321"
    assert_equal "54321", attendee.zip_code
  end

  def test_it_can_create_dataset_from_csv
    import = AttendeeDataImport.new
    filename = "./test/event_attendees_test.csv"
    data = import.import_csv(filename)
    parsed_data = import.parse_data(data)
    attendees = import.create_attendees(parsed_data)
    assert_kind_of Array, attendees
    assert_equal "Chris", attendees.last.first_name
  end

end

