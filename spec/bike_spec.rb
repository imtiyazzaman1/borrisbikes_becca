require 'bike'

describe Bike do
  bike = Bike.new
  it { is_expected.to respond_to :working?}
end
