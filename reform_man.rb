

man = []
i = 0
j = 0

man[0] = 13967
man[1] = 90021
man[2] = 281573
man[3] = 434270
man[4] = 470715
man[5] = 633583
man[6] = 1435101
man[7] = 2025122
man[8] = 2327813
man[9] = 2907459
man[10] = 3781775
man[11] = 5835542
man[12] = 8043649
man[13] = 8280404
man[14] = 9572567
man[15] = 12892870
man[16] = 15786749
man[17] = 16249253
man[18] = 20740273
man[19] = 23420020
man[20] = 28232182
man[21] = 36304607
man[22] = 37718180
man[23] = 59099298
man[24] = 86131688
man[25] = 101957323
man[26] = 171909416
man[27] = 49567
man[28] = 13833474
man[29] = 10040483
man[30] = 2552765
man[31] = 433909
man[32] = 1788449
man[33] = 82618
man[34] = 37997117
man[35] = 2477387
man[36] = 1398630
man[37] = 73476897

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