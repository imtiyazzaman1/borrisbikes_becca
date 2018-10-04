require 'docking_station'
require 'bike'

describe DockingStation do
	it { is_expected.to respond_to :release_bike }

	it 'releases bike when requested' do
		docking_station = DockingStation.new
		docking_station.dock_bike(Bike.new)
		expect(docking_station.release_bike).to be_an_instance_of(Bike)
	end

it 'docks bikes at the docking station' do
	docking_station = DockingStation.new
	docking_station.dock_bike(Bike.new)
	expect(docking_station.rack.length).to eq 1
end

it 'raises an error if trying to release bike from empty station' do
	docking_station = DockingStation.new
	expect { docking_station.release_bike }.to raise_error('No bikes to release')
end

it 'raises an error if trying to dock bike at a full station' do
	docking_station = DockingStation.new
	docking_station.dock_bike(Bike.new)
	expect { docking_station.dock_bike(Bike.new) }.to raise_error('Docking station full')
end

end


# other syntax
# describe DockingStation do
  # it 'responds to release_bike' do
    # expect(subject).to respond_to :release_bike
  # end
# end
