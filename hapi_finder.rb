file = File.open("hapi.txt", "rb")
hapi_file = File.new("hapi_001.txt", "wb")
times = 0
hapi = []
hapi_point = []
if file
  file.each_line do
  |i|
    if i[0] == "T" || i[0] == "\n"
      next
    elsif i[0] == "S"
      break
    end

    array = i.split(":", 3)
    uid = Integer(array[1])
    unless hapi.include? uid
      hapi[times] = uid
      hapi_point[uid] = 0
      times += 1
    end

    hapi_point[uid] += 1
  end
end

puts times

while times > 0
  string = String(hapi[times - 1]) + " 的hapi指数为 " + String(hapi_point[hapi[times - 1]]) + "\n"
  puts string
  hapi_file.syswrite string
  times -= 1
end