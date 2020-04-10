# -*- coding:UTF-8 -*-

class Danmaku
  attr_accessor :time, :uid, :danmaku_context

  def initialize(a_time, a_uid, danmaku = "")
    @time = a_time
    @uid = a_uid
    @danmaku_context = danmaku
  end

  def exam_uid(man)
    man.include? uid
  end

  def time_array(start_time)
    delta_time = time - start_time
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

man = []
man[0] = 101957323
man[1] = 9572567
man[2] = 12892870
man[3] = 37718180
man[4] = 2025122
man[5] = 171909416
man[6] = 23420020
