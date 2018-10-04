require_relative 'bike'

class DockingStation
  def initialize(capacity = 20)
    #@bike = Bike
    @rack = []
    @capacity = capacity
  end

attr_reader :rack, :capacity

  def release_bike
    raise 'No bikes to release' unless !(@rack.empty?)
    @rack.each do |bike|
      if bike.working?
        @rack.delete(bike)
        return bike
      end
    end
    raise "Cannot release bike. Bike is broken"
  end

  def dock_bike(bike)
    raise 'Docking station full' unless !full?
    @rack << bike
    "You have reported the bike broken" if !(bike.working?)
  end

  private
  def full?
    @rack.length >= @capacity
  end

end
