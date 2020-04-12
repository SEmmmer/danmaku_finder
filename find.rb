# -*- coding:UTF-8 -*-
require_relative 'danmaku.rb'
require "fileutils"

unless File.exist? "test.ass"
  FileUtils.cp_r("base/test.ass", "./")
end

man = []
man[0] = 101957323
man[1] = 9572567
man[2] = 12892870
man[3] = 37718180
man[4] = 2025122
man[5] = 171909416
man[6] = 23420020
man[7] = 470715
# 向同传man致以崇高的敬意

txt_name = "2020-4-11"

ass_file = File.open("test.ass", "r+b")
ass_file.seek(1216, IO::SEEK_SET)
csv_file = File.new("test.csv", "wb")
file = File.new(txt_name + ".txt", "rb")

start_time = 1586609914108
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

    if i_danmaku.exam_uid man
      danmaku_array = i_danmaku.danmaku_context.split("【", 2)
      if danmaku_array[1]
        danmaku_array[1].delete! '】'
      else
        next
      end

      array = i_danmaku.time_array start_time
      if array
        h = array[0]
        min = array[1]
        s = array[2]
        ms = array[3]
      else
        next
      end

      if h >= 3
        next
      end

      format = danmaku_array[0]
      if danmaku_array[0].length == 0
        format = ""
        # 自定义Format
      end

      ass_add_line = "Dialogue: 0,#{h}:#{min}:#{s}.#{ms},#{h}:#{min}:#{s + 1}.#{ms},#{format},,0,0,0,,#{danmaku_array[1]}"
      csv_add_line = "0,#{h}:#{min}:#{s}.#{ms},#{h}:#{min}:#{s + 1}.#{ms},#{format},,0,0,0,,#{danmaku_array[1]}"
      ass_file.syswrite(ass_add_line)
      csv_file.syswrite(csv_add_line)
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


