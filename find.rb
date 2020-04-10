# -*- coding:UTF-8 -*-
require_relative 'danmaku.rb'

man = []
man[0] = 101957323
man[1] = 9572567
man[2] = 12892870
man[3] = 37718180
man[4] = 2025122
man[5] = 171909416
man[6] = 23420020
# 向同传man致以崇高的敬意

ass_file = File.new("test.ass", "ab")
csv_file = File.new("test.csv", "wb")
file = File.new("2020-4-9.txt", "rb")

start_time = 1586361620315
# 去文件里找start time

if file
  file.each_line do
  |i|
    if i[0] == "T" || i[0] == "\n"
      next
    elsif i[0] == "S"
      break
    end

    i_array = i.split(":", 3)
    i_danmaku = Danmaku.new(Integer(i_array[0]), Integer(i_array[1]), i_array[2].force_encoding("UTF-8"))

    if i_danmaku.uid == man[6] || i_danmaku.uid == man[3] || i_danmaku.uid == man[5]
      danmaku_array = i_danmaku.danmaku_context.split("【", 2)
      if danmaku_array[1]
        danmaku_array[1].delete! '】'
      else
        next
      end

      delta_time = i_danmaku.time - start_time

      if delta_time < 0
        next
      end

      delta_time /= 10
      ms = delta_time % 100
      delta_time /= 100
      s = delta_time % 60
      delta_time /= 60
      min = delta_time % 60
      delta_time /= 60
      h = delta_time

      # if h > 5
      #   next
      # end

      format = danmaku_array[0]
      if danmaku_array[0].length == 0
        format = "吹雪"
        # 自定义Format
      end

      ass_add_line = "Dialogue: 0,#{h}:#{min}:#{s}.#{ms},#{h}:#{min}:#{s + 1}.#{ms},#{format},,0,0,0,,#{danmaku_array[1]}"
      csv_add_line = "0,#{h}:#{min}:#{s}.#{ms},#{h}:#{min}:#{s + 1}.#{ms},#{format},,0,0,0,,#{danmaku_array[1]}"
      # ass_file.syswrite(ass_add_line)
      # csv_file.syswrite(csv_add_line)
      puts ass_add_line
      # puts csv_add_line
      # 一技能实战
      # 二技能调试
    end
  end
else
  puts "Failed to read file."
end

file.close