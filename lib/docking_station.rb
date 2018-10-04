require_relative 'bike'

class DockingStation
  def initialize
    #@bike = Bike
    @rack = []
  end

attr_reader :rack

  def release_bike
    raise 'No bikes to release' unless !(@rack.empty?)
    Bike.new
  end

  def dock_bike(bike)
    raise 'Docking station full' unless @rack.length < 1
    @rack << bike
  end

end
