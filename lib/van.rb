require_relative 'bike'
require_relative 'docking_station'

class Van
  attr_accessor :van_broken_bikes, :van_fixed_bikes, :van_capacity, :bikes

  VAN_DEFAULT_CAPACITY = 20
  def initialize(van_capacity = VAN_DEFAULT_CAPACITY)
    @van_broken_bikes = []
    @van_fixed_bikes = []
    @van_capacity = van_capacity
  end

  def retrieve_bikes(docking_station)
    @bikes = docking_station.bikes 
    @bikes.each do |bike|
      fail 'Van is full' if full?
      @van_broken_bikes << bike if bike.broken
      end
    @bikes.delete_if { |bike| bike.broken }
  end

  def release_bikes(docking_station)
    fail 'Van is empty' if empty?
    @bikes = docking_station.bikes
    @van_fixed_bikes.each do |bike|
      @bikes << bike
      end
    @van_fixed_bikes.clear 
  end

  private

  def full?
    @van_broken_bikes.length + @van_fixed_bikes.length >= @van_capacity
  end

  def empty?
    @van_broken_bikes.length + @van_fixed_bikes.length == 0
  end
end
