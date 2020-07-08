require 'Docking_Station'

describe DockingStation do
  it 'responds to release_bike' do
    expect(subject).to respond_to :release_bike
  end
  it 'releases a working bike' do
    bike = Bike.new
    expect(bike).to be_working
  end
  it 'docks a bike' do
    bike = Bike.new
    expect(subject.dock_bike(bike)).to eq(bike)
  end
  it 'checks a bike is availble' do
    bike = Bike.new
    subject.dock_bike(bike)
    expect(subject.bike).to eq(bike)
  end
  describe '#release_bike' do
    it 'raises an error if no bike is available' do
      expect {subject.release_bike}.to raise_error 'No bikes available'
    end
  end
  describe '#dock_bike(bike)' do
    it 'raises an error if a bike is already docked here' do
      subject.dock_bike(Bike.new)
      expect {subject.dock_bike(Bike.new)}.to raise_error 'Docking station already in use'
    end
  end
end
