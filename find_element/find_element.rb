def find_element(array, element)
  for i in 0..array.length
    current_element = array[i]

    if current_element == element
      p "Элемент #{element} входит в массив"
    end
      p "Элемент #{element} не найден в массиве"
  end
end

find_element([1, 4, 5, 6, 7,  8], 8)