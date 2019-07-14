def distance_between_elements(array, item)
  distance_array = []
  max_range = "элемент #{item} не найден, или массив пуст"

  for i in 0..array.size
    if item == array[i]
      distance_array.push(i)
    end
  end

  if distance_array.size > 0
    max_range = distance_array[-1] - distance_array[0]
  end

  max_range
end
