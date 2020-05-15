# -*- coding: utf-8 -*

require 'mongo'

client = Mongo::Client.new('mongodb://127.0.0.1:27017/test')

# begin
#   while true
question = client[:question]
#     uid_col = client[:uid]
single = question.find
#
#
#   end
# rescue
# end
puts single