class Garage
  def initialize
    @storage = []
  end

  def storage
    @storage
  end

  def fix_bikes
    storage.map do |bike|
      bike.fixed
    end
  end
end
