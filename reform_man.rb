man = []
i = 0
j = 0

max_num = man.length

while i < max_num
  while j < max_num
    if man[i] < man[j]
      tmp = man[i]
      man[i] = man[j]
      man[j] = tmp
    end
    j += 1
  end
  j = 0
  i += 1
end

time = 0
while time < max_num
  puts "man[#{time}] = #{man[time]}"
  time += 1
end