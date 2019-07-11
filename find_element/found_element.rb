def found_element(array, item)
  found_item = "#{item} no found"

  for i in 0..array.size
    if array[i] === item
      found_item = array[i]
    end
  end

  found_item
end
