require './lib/phone_number'
require 'csv'

class Attendee
  attr_accessor :first_name, :last_name

  def initialize(input = {})
    @first_name = input[:first_name]
    @last_name = input[:last_name]
    @phone_number = PhoneNumber.new(input[:phone_number])
    @zip_code = ZipCode.new(input[:zip_code])
  end

  def phone_number
    @phone_number.number
  end

  def phone_number=(value)
    @phone_number = PhoneNumber.new(value)
  end

  def zip_code
    @zip_code.zip_code
  end

  def zip_code=(value)
    @zip_code = ZipCode.new(value)
  end

end