require 'garage'
describe Garage do 
    describe '#retrieve_bikes' do 
      it 'takes broken bikes from van' do
        station = DockingStation.new
        bike = Bike.new
        bike.report_broken
        van = Van.new
        station.dock_bike(bike)
        van.retrieve_bikes(station)
        subject.retrieve_bikes(van)
        expect(van.van_broken_bikes).to be_empty
        expect(subject.garage_broken_bikes).to include(bike)
      end
    end
end 