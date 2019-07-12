def distance_between_elements(array)
  distance_array = []

  for j in 0..array.length
    for i in 0..array.length
      if array[j] == array[i]
        distance_array.push(i - j)
        distance_array.max
      end
    end
  end

  distance_array.max
end
