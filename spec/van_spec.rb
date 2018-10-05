require 'van'
require 'docking_station'

describe Van do
  let (:station) { double :station }
  let (:bike) { double :bike }
  let (:bike_2) { double :bike_2 }
  let (:garage) { double :garage }

  describe "#collect_broken_bikes" do
    it "should collect broken bikes from docking stations" do
      allow(station).to receive(:rack).and_return [bike]
      allow(bike).to receive(:broken?).and_return true
      expect(subject.collect_broken_bikes(station)).to eq "Broken bikes have been collected"
    end

    it "should have a broke bike" do
      allow(station).to receive(:rack).and_return [bike]
      allow(bike).to receive(:broken?).and_return true
      subject.collect_broken_bikes(station)
      expect(subject.rack).to eq [bike]
    end

    it "should only collect broken bikes" do
      allow(bike).to receive(:broken?).and_return true
      allow(bike_2).to receive(:broken?).and_return false
      allow(station).to receive(:rack).and_return [bike, bike_2]
      subject.collect_broken_bikes(station)
      expect(subject.rack).to eq [bike]

      # station = DockingStation.new
      # broken_bike = Bike.new(true)
      # working_bike = Bike.new
      # station.dock_bike(working_bike)
      # station.dock_bike(broken_bike)
      # subject.collect_broken_bikes(station)
      # expect(subject.rack). to eq [broken_bike]
    end

    it "should leave only working bikes at the station" do
      allow(bike).to receive(:broken?).and_return true
      allow(bike_2).to receive(:broken?).and_return false
      allow(station).to receive(:rack).and_return [bike, bike_2]
      subject.collect_broken_bikes(station)
      expect(station.rack).to eq [bike_2]
    end
  end

  it "should deliver bikes to garage and be empty after delivery" do
    allow(bike).to receive(:broken?).and_return true
    allow(bike_2).to receive(:broken?).and_return false
    allow(station).to receive(:rack).and_return [bike, bike_2]
    allow(garage).to receive(:storage).and_return []
    subject.collect_broken_bikes(station)
    subject.deliver_broken_bikes(garage)
    expect(garage.storage).to eq [bike]
    expect(subject.rack).to eq []
  end


end
