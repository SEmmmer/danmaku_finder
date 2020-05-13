require 'mongo'

client = Mongo::Client.new('mongodb://127.0.0.1:27017/test')
table = client[:uid]

black_file = File.open("black.txt", "rb")

if black_file
  black_file.each_line do
  |black_id|
    black_id = black_id.delete! "\n"

    unless black_id
      next
    end

    table.find(:uid => black_id).each do
    |man|
      unless man.to_s
        doc = {
            uid: black_id,
            type: "black"
        }
        table.insert_one doc
      end
    end
  end
else
  puts "Failed to read file or already done."
end
black_file.close
