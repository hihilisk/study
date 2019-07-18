class BotForTaxi

  def request_route(from = 0, into = 0)
    p 'Где вы находитесь?:'
    @from = gets.chomp
    p 'Куда вам нужно?:'
    @into = gets.chomp
  end

  def talking_bot
    def grasp_intentions_client(message_client)
      dictionary = { :talking => ['привет', 'здравствуйте', 'подскажите'],
                     :waiting_time => ['когда', 'ждать', 'через'],
                     :time_trip => ['время', 'ехать'],
                     :coast => ['цена', 'стоимость', 'стоит'],
                     :to_order => ['заказать', 'вызвать'] }
      message_client =message_client.downcase
      found_word = (message_client.split & dictionary.flatten(2)).join
      found_word = ((dictionary.select { |_key, value| value.include? found_word}).flatten[0]).to_s

      case found_word
        when 'talking'
          'Здравствуйте. Если вам нужна подсказка, введите "помощь"'
        when 'waiting_time'
          calculate_time_waiting
          "#{@time_h >= 1 ? "Время ожидания #{@time_h} ч, #{@time_m} минут." : "Время ожидания около #{@time_m} минут."}"
        when 'time_trip'
          calculate_time_trip
          "#{@time_trip_h >= 1 ? "Приммерное время поездки #{@time_h} ч, #{@time_m} минут." : "Примерное время поездки #{@time_m} минут."}"
        when 'coast'
          calculate_coast
          "Стоимость поездки #{@coast >= 100 ? "#{@coast} рублей" : "#{@coast} рубля"}."
        when 'to_order'

        else
          'Пожалуйста, повторите вопрос. Если вы хотите узнать:' \
        'Время подачи машины, ваш вопрос должен содержать одно из следующих слов: "когда", "ждать", "через"' \
        'Время пути из пункта А в пункт Б, ваш вопрос должен содержать: "время", "ехать"' \
        'Стоимость поездки из пункта А в пукнт Б, ваш вопрос должен содержать: "цена", "стоимость", "стоИт"' \
        'Если вы хотите заказать такси: укажите куда подать такси и место назначения' \
      end
    end
  end

  def create_message
    request_average_speed
    calculate_distance
    calculate_coast
    choice_taxi_car
    calculate_time_waiting
    calculate_time_trip
    @message = "Здравствуйте, ваше такси в пути. "

               "Ваша машина: #{choice_taxi_car[:model]} #{choice_taxi_car[:color]} цвета, гос номер: #{choice_taxi_car[:number]}."
  end

  protected

  def calculate_time_waiting
    if @from == 0
      p 'Где вы находитесь?:'
      @from = gets.chomp
    end

    time = choice_taxi_car[:distance] / request_average_speed
    @time_h = time.floor
    @time_m = ((time - @time_h) * 100 * 0.6).round
  end

  def calculate_time_trip
    time = calculate_distance / request_average_speed
    @time_trip_h = time.floor
    @time_trip_m = ((time - @time_h) * 100 * 0.6).round
  end

  def request_average_speed
    @average_speed = 60.0
  end

  def calculate_distance
    if @from == 0 || @into == 0
      request_route
    end
    @distance_trip = (@from - @into).abs
  end

  def calculate_coast
    rate = 2
    @coast = (calculate_distance + choice_taxi_car[:distance]) / rate
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
