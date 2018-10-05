require 'garage'

describe Garage do
  garage = Garage.new
  it { is_expected.to respond_to :storage}
end
