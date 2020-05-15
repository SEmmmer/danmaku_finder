#-*- coding: utf-8 -*
# 根据黑名单输出这个人发的弹幕

require 'mongo'

client = Mongo::Client.new('mongodb://127.0.0.1:27017/test')
table = client[:uid]
confirm_file = File.new("database/confirm_list.txt", "wb")

table.find({type: "black"}).each do
|i|
  danmaku_file = File.open("database/file2.txt", "rb")
  confirm_file.syswrite "#{i["uid"]}\n"
  danmaku_file.each_line do
  |line|
    array = line.split(":", 3)
    if i["uid"] == array[1]
      confirm_file.syswrite array[2]
    end
  end
  danmaku_file.close
  confirm_file.syswrite "\n"
end