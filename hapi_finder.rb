file = File.open("hapi.txt", "rb")
hapi_file = File.open("true_hapi.txt", "a+b")

if file
  file.each_line do
  |i|
    if i[0] == "/"
      puts i
      hapi_file.syswrite i
    end
  end
end