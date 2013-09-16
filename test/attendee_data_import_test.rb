require 'minitest'
require 'minitest/autorun'
require './lib/attendee_data_import'

class AttendeeDataImportTest < MiniTest::Test

  def test_it_can_be_loaded_from_a_csv_file
    import = AttendeeDataImport.new
    filename = "./test/event_attendees_test.csv"
    data = import.import_csv(filename)
    assert_kind_of CSV, data
  end

  def test_it_can_parse_the_data_correctly_from_csv
    import = AttendeeDataImport.new
    filename = "./test/event_attendees_test.csv"
    data = import.import_csv(filename)
    parsed_data = import.parse_data(data)
    assert_kind_of Hash, parsed_data
    assert_equal "Chris", parsed_data[:name]
  end

end