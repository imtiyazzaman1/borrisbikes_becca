class Bike
  def initialize(broken = false)
    @broken = broken
  end

def broken?
  @broken
end

def working?
  !@broken
end

def fixed
  @broken = false
end

end
