require 'pry'

class Renter

  attr_reader :name,
              :credit_card_number

  def initialize(name_arg, credit_card_number_arg)
    @name = name_arg
    @credit_card_number = credit_card_number_arg
  end

end
