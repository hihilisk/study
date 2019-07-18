class BotForTaxi

  def initialize(from = 0, into = 0)
    @from = 0
    @into = 0
  end

  def grasp_intentions_client(message_client)
    dictionary = { :talking => ['привет', 'здравствуйте', 'подскажите'],
                   :waiting_time => ['когда', 'ждать', 'через'],
                   :time_trip => ['время', 'ехать', 'времени'],
                   :coast => ['цена', 'стоимость', 'стоит'],
                   :to_order => ['заказать', 'вызвать'],
                   :reset => ['забудь', 'сброс'] }
    message_client = message_client.downcase
    found_word = (message_client.split & dictionary.flatten(2)).join
    found_word = ((dictionary.select { |_key, value| value.include? found_word}).flatten[0]).to_s

    case found_word
    when 'talking'
      p 'Здравствуйте. Если вам нужна подсказка, введите "помощь"'
      _start_talking = gets.chomp
      _start_talking == nil ? grasp_intentions_client('привет') : grasp_intentions_client(_start_talking)

    when 'waiting_time'
      calculate_time_waiting
      p "#{@time_h > 0 ? "Время ожидания #{@time_h} ч, #{@time_m} минут." : "Время ожидания около #{@time_m} минут."}"
      validation_entered_date

    when 'time_trip'
      calculate_time_trip
      p "#{@time_trip_h > 0 ? "Приммерное время поездки #{@time_trip_h} ч, #{@time_trip_m} минут." : "Время поездки около #{@time_trip_m} минут."}"
      validation_entered_date

    when 'coast'
      calculate_coast
      p "Стоимость поездки #{(@coast % 5 || @coast % 0) ? "#{@coast} рублей" : "#{@coast} рубля"}."
      validation_entered_date

    when 'to_order'
      validation_entered_date

    when 'reset'
      reset

    else
      p 'Пожалуйста, повторите вопрос. Если вы хотите узнать:' \
      'Время подачи машины, ваш вопрос должен содержать одно из следующих слов: "когда", "ждать", "через"' \
      'Время пути из пункта А в пункт Б, ваш вопрос должен содержать: "время", "ехать"' \
      'Стоимость поездки из пункта А в пукнт Б, ваш вопрос должен содержать: "цена", "стоимость", "стоИт"' \
      'Если вы хотите заказать такси: укажите куда подать такси и место назначения' \
      'Что бы сбросить заказ отправьте "забудь" или "сброс"'
      _start_talking = gets.chomp
      _start_talking == nil ? grasp_intentions_client('привет') : grasp_intentions_client(_start_talking)
    end
  end

  def request_route(from = 0, into = 0)
    p 'Где вы находитесь?:'
    @from = gets.chomp
    p 'Куда вам нужно?:'
    @into = gets.chomp
  end

  def calculate_time_waiting
    if @from == 0
      p 'Где вы находитесь?:'
      @from = gets.chomp
    end

    time = choice_taxi_car[:distance] / request_average_speed
    @time_h = time.floor
    @time_m = ((time - @time_h) * 100 * 0.6).round

    return @time_h, @time_m
  end

  def calculate_time_trip
    time = calculate_distance / request_average_speed
    @time_trip_h = time.floor
    @time_trip_m = ((time - @time_trip_h) * 100 * 0.6).round

    return @time_trip_h, @time_trip_m
  end

  def calculate_coast
    rate = 2
    @coast = (calculate_distance + choice_taxi_car[:distance]) / rate
  end

  def calculate_distance
    if @from == 0 || @into == 0
      request_route
    end
    @distance_trip = (@from.to_i - @into.to_i).abs
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

  def validation_entered_date
    if @from != 0 || @into != 0
      p 'Хотите оформить заказ? Если да, то отправьте "да", в ином случае вы вернетесь в начало'
      _client_response = gets.chomp
      if _client_response == 'да'
        p "Проверьте введенные данные. Начальный адрес: #{@from}, адрес назначения: #{@into}. Если введенные данные совпадают отправьте 'да'"
        _correct = gets.chomp
        if _correct == 'да'
          created_order
        else
          request_route
          validation_entered_date
        end
      else
        grasp_intentions_client(_client_response)
      end
    else
      request_route
      validation_entered_date
    end
  end

  def created_order
    _taxi= choice_taxi_car
    _time_trip = calculate_time_trip
    _time_waiting = calculate_time_waiting
    _coast = calculate_coast
    @order_data = { from: @from, into: @into, distance: @distance_trip, time_trip: _time_trip, time_waiting: _time_waiting, coast: @coast, taxi_car: @taxi_car }
    create_message
  end

  def create_message
    "Спасибо за ожидание, ваша машина #{@order_data[:taxi_car][:color]} #{@order_data[:taxi_car][:model]} гос. номер: #{@order_data[:taxi_car][:number]}" \
    " Стоимость поездки #{(@order_data[:coast] % 5 || @order_data[:coast] % 0) ? "#{@order_data[:coast]} рублей" : "#{@order_data[:coast]} рубля"}." \
    " #{@order_data[:time_waiting][0] > 0 ? "Транспорт будет через #{@order_data[:time_waiting][0]} ч, #{@order_data[:time_waiting][1]} минут." : "Транспорт будет через #{@order_data[:time_waiting][1]} минут."}" \
    " #{@order_data[:time_trip][0] > 0 ? "Приммерное время поездки #{@order_data[:time_trip][0]} ч, #{@order_data[:time_trip][1]} минут." : "Время поездки около #{@order_data[:time_trip][1]} минут."}"
  end

  def reset
    @from = 0
    @into = 0
    grasp_intentions_client('привет')
  end
end
