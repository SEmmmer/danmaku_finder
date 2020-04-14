# -*- coding:UTF-8 -*-
require_relative 'danmaku.rb'
require "fileutils"


if ARGV[0] == nil
  puts "Please input date (format: YYYY-MM-DD) : "
  txt_name = gets.delete! "\n"
else
  txt_name = ARGV[0].delete! ".txt"

end

if ARGV[1] == nil
  puts "Please input time (format: **********) : "
  start_time = Integer(gets.delete! "\n")
else
  start_time = Integer(ARGV[1])

end


unless File.exist? txt_name + ".ass"
  FileUtils.cp_r("base/test.ass", "./" + txt_name + ".ass")
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
man[8] = 434270
man[9] = 1435101
man[10] = 59099298
man[11] = 20740273
man[12] = 3781775
man[13] = 2327813
# 向同传man致以崇高的敬意

ass_file = File.open(txt_name + ".ass", "r+b")
ass_file.seek(1216, IO::SEEK_SET)
file = File.new(txt_name + ".txt", "rb")

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

      if h >= 5
        next
      end

      format = danmaku_array[0]
      if danmaku_array[0].length == 0
        format = ""
        # 自定义Format
      end

      ass_add_line = "Dialogue: 0,#{h}:#{min}:#{s}.#{ms},#{h}:#{min}:#{s + 1}.#{ms},#{format},,0,0,0,,#{danmaku_array[1]}"
      ass_file.syswrite(ass_add_line)
      puts ass_add_line
    end
  end
else
  puts "Failed to read file."
end

file.close


