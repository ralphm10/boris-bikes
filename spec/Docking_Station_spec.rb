require 'Docking_Station'

describe DockingStation do
  let(:bike) { double :bike }
  it 'responds to release_bike' do
    expect(subject).to respond_to :release_bike
  end
  it 'releases a working bike' do
    expect(double(:working? => true)).to be_working
  end
  it 'docks a bike' do
    expect(subject.dock_bike(double (:bike))).to eq(subject.bikes)
  end
  it 'checks a bike is availble' do
    subject.dock_bike(double(:bike))
    expect(subject.bikes.length).to be >(0)
  end
  describe '#release_bike' do
    it 'raises an error if no bike is available' do
      expect {subject.release_bike}.to raise_error 'No bikes available'
    end
    it 'raise an error if the bike to be released is broken' do
      bike = double(:broken => true)
      subject.dock_bike(bike)
      expect { subject.release_bike }.to raise_error 'This bike is broken'
    end
  end
  describe '#dock_bike(bike)' do
    it 'raises an error if the docking station is already full' do
      bike = double(:bike)
      DockingStation::DEFAULT_CAPACITY.times{ subject.dock_bike(bike) }
      expect { subject.dock_bike(bike) }.to raise_error 'Docking station is full'
    end
  end
  it 'initializes with a capacity given by the argument' do
      station = DockingStation.new(30)
      expect(station.capacity).to eq 30
  end
  it 'initializes with a default capacity of 20 when no argument given' do
      station = DockingStation.new
      expect(station.capacity).to eq 20
  end
end
