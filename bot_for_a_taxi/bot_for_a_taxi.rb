class TaxiToolkit
  attr_reader :from, :into, :time_waiting, :time_trip, :taxi_car, :coast, :distance_trip
  AVERAGE_SPEED = 60.0

  def initialize(from, into)
    @from = from
    @into = into
    calculate_distance
    choice_taxi_car
    calculate_coast
    calculate_time_trip
    calculate_time_waiting
  end

  private

  def calculate_time_waiting
    @time_waiting = @taxi_car[:distance] / AVERAGE_SPEED
    @time_waiting = "#{@time_waiting.floor}h. #{((@time_waiting - @time_waiting.floor) * 60).round}min."
  end

  def calculate_time_trip
    @time_trip = @distance_trip.to_i / AVERAGE_SPEED
    @time_trip = "#{@time_trip.floor}h. #{((@time_trip - @time_trip.floor) * 60).round}min."
  end

  def calculate_coast
    rate = (rand * 10).round(2)
    @coast = "#{((@distance_trip.to_i + @taxi_car[:distance]) / rate).round(2)} USD"
  end

  def calculate_distance
    @distance_trip = "#{(@from - @into).abs} km"
  end

  def choice_taxi_car
    taxi_car_location = [ { model: 'Hyundai solaris', color: 'grey', number: 'x161xx161', distance: 5 },
                          { model: 'Lada Kalina', color: 'black', number: 'x162xx162', distance: 10 },
                          { model: 'Lada Granta', color: 'white', number: 'x163xx163', distance: 15 } ]

    @taxi_car = taxi_car_location.each { |car| car[:distance] = (car[:distance] - @from.to_i).abs }
    @taxi_car = @taxi_car.min_by { |car| car[:distance] }
  end
end
