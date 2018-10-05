require 'garage'
require 'bike'

describe Garage do

  let(:bike) { double :bike }

  it { is_expected.to respond_to :storage}

  it "should fix broken bikes" do
    broken_bike = Bike.new(true)
    subject.storage << broken_bike
    subject.fix_bikes
    expect(subject.storage.first.working?).to eq true

  end
end
