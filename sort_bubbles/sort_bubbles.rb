def sort_array(array)
  for j in 0...array.length
    for i in 0...array.length - 1
      current_element = array[i]
      next_element = array[i + 1]

      if current_element > next_element
        temp = current_element
        array[i] = next_element
        array[i + 1] = temp
      end
    end
  end

  array
end
