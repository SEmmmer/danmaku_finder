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
    if delta_time > 0
      delta_time /= 10
      ms = delta_time % 100
      delta_time /= 100
      s = delta_time % 60
      delta_time /= 60
      min = delta_time % 60
      delta_time /= 60
      h = delta_time
      [h, min, s, ms]
    else
      nil
    end
  end
end
