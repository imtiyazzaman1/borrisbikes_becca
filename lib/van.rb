class Van
  def initialize
    @rack = []
  end

  def rack
    @rack
  end

  def collect_broken_bikes(station)
    @rack << station.rack[0]
    "Broken bikes have been collected"
  end
end
