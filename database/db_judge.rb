# -*- coding: utf-8 -*

require 'mongo'

client = Mongo::Client.new('mongodb://127.0.0.1:27017/test')

question = client[:question]

begin
  while true
    uid_col = client[:uid]
    uid_list = []
    uid_col.find.each do
    |i|
      uid_list.append i['uid']
    end

    single = question.aggregate([{'$sample': {size: 1}}])

    single.each do
    |i|
      single = i
    end

    unless uid_list.include? single["uid"]
      uid_col.update_one({}, {:uid => single['uid'], :type => "white"})
      $regret_uid = single['uid']
      puts $regret_uid
      puts '请问该言论是否引战，是请输入1，否请直接回车：'
      puts single['danmaku']
      string = gets
      if string == "1\n"
        uid_col.update_one({:uid => single['uid']}, {:type => "black"})
      end
      question.delete_one(:question => single["danmaku"])
    end
  end
rescue Interrupt
  puts "用户终止进程"
  client[:uid].delete_one({:uid => $regret_uid})

end