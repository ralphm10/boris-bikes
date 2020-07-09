require_relative 'bike'

class DockingStation
  attr_reader :bikes, :capacity
  
  DEFAULT_CAPACITY = 20
  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
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
    @bikes.length >= @capacity
  end

  def empty?
    @bikes.length == 0
  end
end
