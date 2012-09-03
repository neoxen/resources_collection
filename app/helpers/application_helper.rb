#encoding: utf-8
module ApplicationHelper
  def time_zh(time)
    time.strftime("创建于 %B %d on %I:%M %p")
  end
end
