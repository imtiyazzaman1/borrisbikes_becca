require_relative 'bike'

class DockingStation
  def initialize
    #@bike = Bike
    @rack = []
  end

attr_reader :rack

  def release_bike
    Bike.new
  end

  def dock_bike(bike)
    @rack << bike
  end

end
