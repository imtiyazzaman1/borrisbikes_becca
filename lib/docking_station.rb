require_relative 'bike'

class DockingStation
  def initialize
    @bike = Bike
  end


  def release_bike
    Bike.new
  end


end
