# -*- coding: utf-8 -*

require 'mongo'

client = Mongo::Client.new('mongodb://127.0.0.1:27017/test')
table = client[:uid]

miss_black_file = File.open("drop_list.txt", "rb")

if miss_black_file
  miss_black_file.each_line do
  |miss|
    miss.delete! "\n"

    unless miss
      next
    end
    table.delete_one({:uid => miss})
  end
end