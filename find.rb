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

      format = danmaku_array[0]
      if danmaku_array[0].length == 0
        format = ""
        # 自定义Format
      end

      ass_add_line = "Dialogue: 0,#{h}:#{min}:#{s}.#{ms},#{h}:#{min}:#{s + 1}.#{ms},#{format},,0,0,0,,#{danmaku_array[1]}"
      ass_file.syswrite(ass_add_line)
      puts ass_add_line
    else
      next
    end
  end
  puts "Failed to read file."
end

file.close


