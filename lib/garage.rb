class Garage
  attr_accessor :van_broken_bikes, :van_fixed_bikes, :garage_broken_bikes, :garage_fixed_bikes

  DEFAULT_CAPACITY = 20
  def initialize(garage_capacity = DEFAULT_CAPACITY)
    @garage_broken_bikes = []
    @garage_fixed_bikes = []
    @garage_capacity = garage_capacity
  end

  def retrieve_bikes(van)
    @van_broken_bikes = van.van_broken_bikes
    @van_broken_bikes.each do |bike|
      @garage_broken_bikes << bike
    end
    @van_broken_bikes.clear
  end
end