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
    Bike.new
  end

  def dock_bike(bike)
    raise 'Docking station full' unless !full?
    @rack << bike
  end

  private
  def full?
    @rack.length >= @capacity
  end

end
