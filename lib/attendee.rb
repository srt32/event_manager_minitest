class Attendee
  attr_accessor :first_name
  attr_accessor :last_name
  attr_accessor :phone_number

  def initialize(input = {})
    @first_name = input[:first_name]
    @last_name = input[:last_name]
    @phone_number = input[:phone_number]
  end

end