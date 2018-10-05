class Van
  def initialize
    @rack = []
  end

  def rack
    @rack
  end

  def collect_broken_bikes(station)
    station.rack.each do |bike|
      if bike.broken?
        @rack << bike
        station.rack.delete(bike)
      end
    end
    "Broken bikes have been collected"
  end

  def deliver_broken_bikes(garage)
    @rack.each do |bike|
      garage.storage << bike
    end
    @rack = []
  end
end
