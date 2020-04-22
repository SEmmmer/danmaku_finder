file = File.open("hapi_001.txt", "rb")

if file
  file.each_line do
  |i|
    array = i.split(" ", 3)
    if Integer(array[2]) >= 20
      puts i
    end
  end
end