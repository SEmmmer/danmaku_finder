class NilClass
  def blank?
    true
  end
end

class String
  def blank?
    self.size == 0
  end
end

["","person",nil].each do |element|
  puts element unless element.blank?
end
# class ActsAsCsv
#   def read
#     file = File.new(self.class.to_s.downcase + ".txt")
#     @headers = file.get.chomp.split(",")
#     file.each do |row|
#       @result << row.chomp.split(",")
#     end
#   end
#
#   def headers
#     @headers
#   end
#
#   def csv_contents
#     @result
#   end
#
#   def initialize
#     @result = []
#     read
#   end
# end
#
# class RubyCsv < ActsAsCsv
#
# end
#
# m = RubyCsv.new
# puts m.headers.inspect
# puts m.csv_contents.inspect