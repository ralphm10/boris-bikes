require_relative 'bike'

class DockingStation
  attr_reader :bike
  def release_bike
    fail 'No bikes available' unless @bike
      @bike
  end
  def dock_bike(bike)
    fail 'Docking station already in use' if @bike
      @bike = bike
  end
end
