require 'docking_station'
require 'bike'

describe DockingStation do
	let(:bike) { double :bike }
	it { is_expected.to respond_to :release_bike }

	it 'releases bike when requested' do
		docking_station = DockingStation.new
		allow(bike).to receive(:working?).and_return(true)
		docking_station.dock_bike(bike)
		expect(docking_station.release_bike).to eq bike
	end

it 'docks bikes at the docking station' do
	docking_station = DockingStation.new
	allow(bike).to receive(:working?).and_return(true)
	docking_station.dock_bike(bike)
	expect(docking_station.rack.length).to eq 1
end

it 'raises an error if trying to release bike from empty station' do
	docking_station = DockingStation.new
	expect { docking_station.release_bike }.to raise_error('No bikes to release')
end

it 'raises an error if trying to dock bike at a full station' do
	docking_station = DockingStation.new
	allow(bike).to receive(:working?).and_return(true)
	20.times { docking_station.dock_bike(bike) }
	expect { docking_station.dock_bike(bike)}.to raise_error('Docking station full')
end

it 'lets user change capacity' do
	docking_station = DockingStation.new(10)
	allow(bike).to receive(:working?).and_return(true)
	10.times { docking_station.dock_bike(bike) }
	expect { docking_station.dock_bike(bike) }.to raise_error('Docking station full')
end

it 'allows users to report if bike is broken' do
	docking_station = DockingStation.new
	allow(bike).to receive(:working?).and_return(false)
	expect(docking_station.dock_bike(bike)).to eq "You have reported the bike broken"
end

it 'refuses to release broken bikes' do
	docking_station = DockingStation.new
	allow(bike).to receive(:working?).and_return(false)
	docking_station.dock_bike(bike)	
	expect { docking_station.release_bike }.to raise_error('Cannot release bike. Bike is broken')
end

end


# other syntax
# describe DockingStation do
  # it 'responds to release_bike' do
    # expect(subject).to respond_to :release_bike
  # end
# end
