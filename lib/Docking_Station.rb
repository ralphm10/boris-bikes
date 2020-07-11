require_relative 'bike'

class DockingStation
  attr_accessor :bikes, :capacity

  DEFAULT_CAPACITY = 20
  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def release_bike
    fail 'No bikes available' if empty?
    fail 'This bike is broken' if @bikes.pop.broken
    @bikes
  end

  def dock_bike(bike)
    fail 'Docking station is full' if full?
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
