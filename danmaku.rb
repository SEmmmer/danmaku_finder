# -*- coding:UTF-8 -*-

class Danmaku
  attr_accessor :time, :uid, :danmaku_context

  def initialize(a_time, a_uid, a_danmaku = "")
    @time = a_time
    @uid = a_uid
    @danmaku_context = a_danmaku
  end

  def exam_uid(man)
    man.include? uid
  end

  def time_array(start_time)
    delta_time = time - start_time
    if delta_time < 0
      [nil, nil, nil, nil]
    end
    delta_time /= 10
    ms = delta_time % 100
    delta_time /= 100
    s = delta_time % 60
    delta_time /= 60
    min = delta_time % 60
    delta_time /= 60
    h = delta_time

    [h, min, s, ms]
  end
end

start_time = 1500
one_danmaku = Danmaku.new(1000,200,"abc")
two_danmaku = Danmaku.new(2000,300,"def")
puts one_danmaku.time_array start_time
puts
puts two_danmaku.time_array start_time
