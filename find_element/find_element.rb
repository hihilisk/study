def find_element(array, item)
  for i in 0..array.length
    if array[i] === item
      find_item = array[i]
    end
  end
  find_item
end
