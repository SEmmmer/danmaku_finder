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

ruby_tree = Danmaku.new(1919, 99999, "app")

puts "Visiting a danmaku"
ruby_tree.visit { |danmaku| puts danmaku.danmaku_context }
puts
