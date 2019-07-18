def talking_bot(message_client)
  dictionary = { :waiting_time => ['когда', 'ждать', 'через'],
                 :trip_time => ['время', 'время', 'ехать'],
                 :coast => ['цена', 'стоимость', 'стоит'],
                 :to_order => ['заказать', 'вызвать'] }
  message_client =message_client.downcase
  found_word = message_client.split & dictionary.flatten(2)
  intention_client = dictionary.select { |value| value == found_word }
  p intention_client
end
