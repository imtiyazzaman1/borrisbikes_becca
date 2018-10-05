require 'van'
require 'docking_station'

describe Van do
  it "should collect broken bikes from docking stations" do
    station = DockingStation.new
    bike = Bike.new(true)
    station.dock_bike(bike)

    expect(subject.collect_broken_bikes(station)).to eq "Broken bikes have been collected"
  end

  it "should have a broke bike" do
    station = DockingStation.new
    bike = Bike.new(true)
    station.dock_bike(bike)
    subject.collect_broken_bikes(station)
    expect(subject.rack).to eq [bike]
  end
end
