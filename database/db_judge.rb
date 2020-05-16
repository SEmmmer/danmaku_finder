# -*- coding: utf-8 -*

require 'mongo'

client = Mongo::Client.new('mongodb://127.0.0.1:27017/test')
question = client[:question]
uid_col = client[:uid]

begin
  while true
    single = question.aggregate([{'$sample': {size: 1}}])

    get = false
    single.each do
    |i|
      single = i
      get = true
    end

    unless get
      raise SystemExit, "The database is NULL now"
    end

    uid_col.insert_one({:uid => single['uid'], :type => "white"})
    $regret_uid = single['uid']
    puts $regret_uid
    puts '请问该言论是否引战，是请输入1，否请直接回车：'
    puts single['danmaku']
    string = gets
    if string == "1\n"
      uid_col.update_one({:uid => single['uid']}, {:type => "black"})
    end
    question.delete_many(:question => single["danmaku"])
    question.delete_many(:uid => single["uid"])
  end
rescue Interrupt
  puts "用户终止进程"
  client[:uid].delete_many({:uid => $regret_uid})
rescue SystemExit
  puts "数据库为空，程序已结束"
# ignored
end