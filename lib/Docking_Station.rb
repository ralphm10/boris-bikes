require_relative 'bike'

class DockingStation
  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def release_bike
    fail 'No bikes available' unless @bikes.length > 0 
      @bikes
  end
  def dock_bike(bike)
    fail 'Docking station already in use' if @bikes.length >= 20
      @bikes.push(bike)
  end
end
