def sort_array(unsorted_array)
  for j in 0...unsorted_array.length
    for i in 0...unsorted_array.length - 1
      current_element = unsorted_array[i]
      next_element = unsorted_array[i + 1]

      if current_element > next_element
        temp = current_element
        unsorted_array[i] = next_element
        unsorted_array[i + 1] = temp
      end
    end
  end
  sorted_array = unsorted_array.join(', ')
end
