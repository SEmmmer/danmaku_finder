# -*- coding:UTF-8 -*-
class Danmaku
  attr_accessor :time, :uid, :danmaku_context

  def initialize(time, uid, danmaku = "")
    @time = time
    @uid = uid
    @danmaku_context = danmaku
  end
end

#day_before: 距离4月7日的天数
# start_h: 开始的小时
# start_h: 开始的分钟
day_before = 1
start_h = 21
start_m = 59

def time_calculate(day_before, start_h, start_m)
  plus = day_before * 24 * 3600 * 1000
  adjust = (start_h - 20) * 3600 * 1000 + (start_m - 4) * 60 * 1000
  plus + adjust
end

man = []
man[0] = 101957323
man[1] = 9572567
man[2] = 12892870
man[3] = 33718180
# 向同传man致以崇高的敬意

ass_file = File.new("test.ass", "ab")

# 经计算，这个时间是2020-4-7 20：04
start_time = 1586264660000
# 修正后的时间
start_time += time_calculate(day_before, start_h, start_m)

file = File.new("2020-4-7.txt", "rb")

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

    if i_danmaku.uid == man[0] || i_danmaku.uid == man[1] || i_danmaku == man[2]
      danmaku_array = i_danmaku.danmaku_context.split("【", 2)
      danmaku_array[1].delete! '】'

      delta_time = i_danmaku.time - start_time
      delta_time /= 10
      ms = delta_time % 100
      delta_time /= 100
      s = delta_time % 60
      delta_time /= 60
      min = delta_time % 60
      delta_time /= 60
      h = delta_time

      format = danmaku_array[0]
      if danmaku_array[0].length == 0
        format = ""
        # 自定义Format
      end

      add_line = "Dialogue: 0,#{h}:#{min}:#{s}.#{ms},#{h}:#{min}:#{s + 1}.#{ms},#{format},,0,0,0,,#{danmaku_array[1]}"
      # ass_file.syswrite(add_line)
      # puts add_line
      # 一技能实战
      # 二技能调试
    end
  end
else
  puts "Failed to read file."
end

file.close