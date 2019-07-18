class TaxiToolkit
  def initialize(from, into)
    @from = from
    @into = into
  end

  def calculate_time_waiting
    @time_waiting = choice_taxi_car[:distance] / request_average_speed
    @time_waiting = "#{@time_waiting.floor}h. #{((@time_waiting - @time_waiting.floor) * 60).round}min."
  end

  def calculate_time_trip
    @time_trip = calculate_distance / request_average_speed
    @time_trip = "#{@time_trip.floor}h. #{((@time_trip - @time_trip.floor) * 60).round}min."
  end

  def calculate_coast
    rate = 8
    @coast = "#{(calculate_distance + choice_taxi_car[:distance]) / rate} USD"
  end

  def calculate_distance
    @distance_trip = (@from - @into).abs
  end

  def choice_taxi_car
    taxi_car_location = { 1 => { model: 'Hyundai solaris', color: 'серая', number: 'x161xx161', distance: 5 },
                          2 => { model: 'Lada Kalina', color: 'черная', number: 'x162xx162', distance: 10 },
                          3 => { model: 'Lada Granta', color: 'белая', number: 'x163xx163', distance: 15 } }

    @taxi_car = taxi_car_location.each { |_key, car| car[:distance] = (car[:distance] - @from.to_i).abs }
    @taxi_car = @taxi_car.min_by { |_key, car| car[:distance] }
    @taxi_car = @taxi_car.flatten[1]
  end

  def request_average_speed
    @average_speed = 60.0
  end

  def reset
    @from = 0
    @into = 0
    @taxi_car = nil
    @time_waiting = nil
    @time_trip = nil
    @distance_trip = nil
    @coast = nil
    @average_speed = nil
  end
end
