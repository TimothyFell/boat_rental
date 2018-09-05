require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/boat'

class BoatTest < Minitest::Test

  def test_it_exists
    kayak = Boat.new(:kayak, 20)

    assert_instance_of Boat, kayak
  end

  def test_it_has_type
    kayak = Boat.new(:kayak, 20)

    assert_equal 20, kayak.price_per_hour
  end

  def test_can_be_rented_for_multiple_hours
    kayak = Boat.new(:kayak, 20)

    assert_equal 0, kayak.hours_rented
    kayak.add_hour
    kayak.add_hour
    kayak.add_hour
    assert_equal 3, kayak.hours_rented
  end

end
