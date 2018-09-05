require 'pry'

class Dock

  attr_reader :name,
              :max_rental_time,
              :rented_list

  def initialize(name_arg, max_rental_time_arg)
    @name = name_arg
    @max_rental_time = max_rental_time_arg
    @rented_list = {}
    @returned_boats = []
    @total_revenue
  end

  def rent(boat, renter)
    renter_name = renter.name
    boat.last_renter = renter.credit_card_number
    # don't want to set an empty array each time
    if @rented_list[renter_name] == nil
      @rented_list[renter_name] = []
      @rented_list[renter_name] << boat
    else
      @rented_list[renter_name] << boat
    end
  end

  def log_hour
    @rented_list.each do |renter, boats|
      boats.each do |boat|
        if boat.hours_rented < @max_rental_time
          boat.add_hour
        end
      end
    end
  end

  def return(boat)
    @rented_list.each do |renter, rented_boats|
      if rented_boats.include?(boat)
        @returned_boats << rented_boats.delete(boat)
      end
    end
  end

  def revenue
    @total_revenue = @returned_boats.sum do |boat|
      boat.hours_rented * boat.price_per_hour
    end
  end

  def charges
    charges = {}
    @returned_boats.each do |boat|
      if charges[boat.last_renter] == nil
        charges[boat.last_renter] = 0
        boat_revenue = boat.hours_rented * boat.price_per_hour
        charges[boat.last_renter] += boat_revenue
      else
        boat_revenue = boat.hours_rented * boat.price_per_hour
        charges[boat.last_renter] += boat_revenue
      end
    end
    charges
  end

  def total_hours_by_rental_type
    hours_by_type = {}
    @returned_boats.each do |boat|
      if hours_by_type[boat.type] == nil
        hours_by_type[boat.type] = 0
        hours_by_type[boat.type] += boat.hours_rented
      else
        hours_by_type[boat.type] += boat.hours_rented
      end
    end
    hours_by_type
  end

end
