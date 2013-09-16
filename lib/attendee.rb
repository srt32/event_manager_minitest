require './lib/phone_number'

class Attendee
  attr_accessor :first_name, :last_name

  def initialize(input = {})
    @first_name = input[:first_name]
    @last_name = input[:last_name]
    @phone_number = PhoneNumber.new(input[:phone_number])
  end

  def phone_number
    @phone_number.number
  end

  def phone_number=(value)
    @phone_number = PhoneNumber.new(value)
  end

end