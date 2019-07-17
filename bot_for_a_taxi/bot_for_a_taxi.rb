class BotForTaxi

  def initialize(from, into)
    @from = from
    @into = into
  end

  def create_message
    request_average_speed
    calculate_distance
    calculate_coast
    choice_taxi_car
    calculate_time_waiting
    calculate_time_trip
    @message = "Здравствуйте, ваше такси в пути. #{@time_h >= 1 ? "Время ожидания #{@time_h} ч, #{@time_m} минут." : "Время ожидания около #{@time_m} минут."}" \
               "Стоимость поездки #{calculate_coast >= 100 ? "#{calculate_coast} рублей" : "#{calculate_coast} рубля"}." \
               "#{@time_trip_h >= 1 ? "Приммерное время поездки #{@time_h} ч, #{@time_m} минут." : "Примерное время поездки #{@time_m} минут."}" \
               "Ваша машина: #{choice_taxi_car[:model]} #{choice_taxi_car[:color]} цвета, гос номер: #{choice_taxi_car[:number]}."
  end

  protected

  def calculate_time_waiting
    distance_to_taxi = choice_taxi_car[:distance]
    time = distance_to_taxi / request_average_speed
    @time_h = time.floor
    @time_m = ((time - @time_h) * 100 * 0.6).round
  end

  def calculate_time_trip
    distance = calculate_distance
    time = distance / request_average_speed
    @time_trip_h = time.floor
    @time_trip_m = ((time - @time_h) * 100 * 0.6).round
  end

  def request_average_speed
    @average_speed = 60.0
  end

  def calculate_distance
    @distance_trip = (@from - @into).abs
  end

  def calculate_coast
    rate = 2
    remoteness_car = choice_taxi_car
    @coast = (@distance_trip + remoteness_car[:distance]) / rate
  end

  def choice_taxi_car
    taxi_car_location = { 1 => { model: 'Hyundai solaris', color: 'серого', number: 'x161xx161', distance: 5 },
                          2 => { model: 'Lada Kalina', color: 'черного', number: 'x162xx162', distance: 10 },
                          3 => { model: 'Lada Granta', color: 'серого', number: 'x163xx163', distance: 15 } }

    @taxi_car = taxi_car_location.each { |_key, car| car[:distance] = (car[:distance] - @from).abs }
    @taxi_car = @taxi_car.min_by { |_key, car| car[:distance] }
    @taxi_car = @taxi_car.flatten[1]
  end
end
