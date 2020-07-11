require 'van'
require 'bike'
require 'Docking_Station'

describe Van do
   
  it 'initializes with a capacity given by the argument' do
      van = Van.new(30)
      expect(van.van_capacity).to eq 30
  end
  it 'initializes with a default capacity of 20 when no argument given' do
      van = Van.new
      expect(van.van_capacity).to eq 20
  end

  describe '#retrieve_bikes' do
    it 'raises an error if the van is already full' do
      station = DockingStation.new(100)
      (Van::VAN_DEFAULT_CAPACITY + 1).times{ 
        bike = Bike.new
        bike.report_broken
        station.dock_bike(bike) }
        
      expect{subject.retrieve_bikes(station)}.to raise_error 'Van is full'
    end
    it 'removes broken bikes from docking station and adds to Van' do
      station = DockingStation.new
      bike = Bike.new
      bike.report_broken
      station.dock_bike(bike)
      subject.retrieve_bikes(station)
      expect(station.bikes).not_to include(bike)
      expect(subject.van_broken_bikes).to include(bike)
    end
    it 'only takes broken bikes from docking stations' do
      station = DockingStation.new
      station.dock_bike(Bike.new)
      subject.retrieve_bikes(station)
      expect(subject.van_broken_bikes).to be_empty
    end
    it 'removes fixed bikes from garages'
  end
  describe '#release_bike' do 
  end

end
      
      
      