require 'csv'

class AttendeeDataImport

  def import_csv(filename)
    data = CSV.open filename, headers: true, header_converters: :symbol
    return data
  end

  def parse_data(data)
    parsed_data = {}
    data.each do |row|
      parsed_data[:id] = row[0]
      parsed_data[:name] = row[:first_name]
      parsed_data[:last_name] = row[:last_name]
    end
    return parsed_data
  end

  def create_attendees(parsed_data)
    attendees = parsed_data.collect do |row|
      attendee = Attendee.new(:id => parsed_data[:id], :first_name => parsed_data[:name], :last_name => parsed_data[:last_name])
    end
    return attendees
  end

end