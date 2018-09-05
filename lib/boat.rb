require 'pry'

class Boat

  attr_reader :price_per_hour,
              :hours_rented

  attr_accessor :last_renter

  def initialize(type_arg, price_per_hour_arg)
    @type = type_arg
    @price_per_hour = price_per_hour_arg
    @hours_rented = 0
    @last_renter = ""
  end

  def add_hour
    @hours_rented += 1
  end

end
