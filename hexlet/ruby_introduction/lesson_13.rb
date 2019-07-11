string = "1 2 3 4 5 6 7 8 9 10"

# BEGIN (write your solution here)
p string.split.map(&:to_i).select{|el| el % 3 == 0} #решение учителя, решить самостоятельно я не смог
#END

# мое решение, но не могу от 'nil' в конце массива избавиться
def del_3(string)
  array = string.split
  result_array = []

  for i in 0..array.length
    if array[i].to_i % 3 == 0
      result_array.push(array[i].to_i)
    end
  end
end
