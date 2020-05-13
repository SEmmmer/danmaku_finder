#-*- coding: utf-8 -*
require 'mongo'

client = Mongo::Client.new('mongodb://127.0.0.1:27017/test')
table = client[:question]

question_file = File.open("file2.txt", "rb")

if question_file
  question_file.each_line do
  |question|
    question.delete! "\n"

    unless question[0] == '1'
      next
    end

    array = question.split(":", 3)
    danmaku_content = array[2].force_encoding("utf-8")
    doc = {
        uid: array[1],
        danmaku: danmaku_content
    }
    table.insert_one(doc)
  end
end
question_file.close