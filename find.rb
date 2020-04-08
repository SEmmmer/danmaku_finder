# -*- coding:UTF-8 -*-
class Danmaku
  attr_accessor :time, :uid, :danmaku_context

  def initialize(time, uid, danmaku = "")
    @time = time
    @uid = uid
    @danmaku_context = danmaku
  end

  def visit(&block)
    block.call(self)
  end
end

man = []
man[0] = 101957323
man[1] = 9572567
man[2] = 12892870

ass_file = File.new("test.ass", "rb")


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
    i_danmaku = Danmaku.new(Integer(i_array[0]), Integer(i_array[1]), i_array[2])

    if i_danmaku.uid == man[0] || i_danmaku.uid == man[1] || i_danmaku == man[2]
    end
  end
else
  puts "Failed to read file."
end

file.close