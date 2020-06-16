def q_sort(arr)
  tmp = arr.pop
  arr_1 = []
  arr_2 = []

  arr.each do
  |i|
    if i < tmp
      arr_1.append i
    else
      arr_2.append i
    end
  end
  if arr_1.size > arr_2.size
    arr_2.append tmp
  else
    arr_1.append tmp
  end

  if arr_1.length <= 1 and arr_2.length <= 1
    return arr_1 + arr_2
  end
  q_sort(arr_1) + q_sort(arr_2)
end

def quick_sort(a)
  (x = a.pop) ? quick_sort(a.select { |i| i <= x }) + [x] + quick_sort(a.select { |i| i > x }) : []
end

array = [2, 213, 45, 2, 67, 77, 2342, 14123, 556, 431, 3]

puts q_sort(array)