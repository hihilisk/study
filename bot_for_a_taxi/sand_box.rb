def talking_bot

  def grasp_intentions_client(message_client)
    dictionary = { :talking => ['привет', 'здравствуйте', 'подскажите'],
                   :waiting_time => ['когда', 'ждать', 'через'],
                   :trip_time => ['время', 'ехать'],
                   :coast => ['цена', 'стоимость', 'стоит'],
                   :to_order => ['заказать', 'вызвать'] }
    message_client =message_client.downcase
    found_word = (message_client.split & dictionary.flatten(2)).join
    found_word = ((dictionary.select { |_key, value| value.include? found_word}).flatten[0]).to_s

    case found_word
    when 'talking'
      'Здравствуйте, чем могу помочь? Если вам нужна подсказка, введите "помощь"'
    when 'waiting_time'
      '!'
    when 'trip_time'
      '!''!'
    when 'coast'
      '!''!''!'
    when 'to_order'
      '!''!''!''!'
    else
      'Пожалуйста, повторите вопрос. Если вы хотите узнать:' \
      'Время подачи машины, ваш вопрос должен содержать одно из следующих слов: "когда", "ждать", "через"' \
      'Время пути из пункта А в пункт Б, ваш вопрос должен содержать: "время", "ехать"' \
      'Стоимость поездки из пункта А в пукнт Б, ваш вопрос должен содержать: "цена", "стоимость", "стоИт"' \
      'Если вы хотите заказать такси: укажите куда подать такси и место назначения' \
    end
  end
end
