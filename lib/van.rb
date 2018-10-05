class Van
  def initialize
    @rack = []
  end

  def rack
    @rack
  end

  def collect_broken_bikes(station)
    station.rack.each do |bike|
    @rack << bike if bike.broken? end
    "Broken bikes have been collected"
  end
end
