require_relative 'bike'

class DockingStation
  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def release_bike
    fail 'No bikes available' if empty? 
    @bikes
  end
  def dock_bike(bike)
    fail 'Docking station already in use' if full? 
    @bikes.push(bike)
  end

  private
  
  def full?
    @bikes.length >= 20
  end

  def empty?
    @bikes.length == 0
  end
end
