require_relative 'bike'

class DockingStation
  def initialize
    #@bike = Bike
    @rack = []
  end

attr_reader :rack

  def release_bike
    if @rack.empty?
      raise 'No bikes to release'
    else
      Bike.new
    end
  end

  def dock_bike(bike)
    @rack << bike
  end

end
