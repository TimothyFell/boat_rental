require 'pry'

class Dock

  attr_reader :name,
              :max_rental_time

  def initialize(name_arg, max_rental_time_arg)
    @name = name_arg
    @max_rental_time = max_rental_time_arg
  end

end
