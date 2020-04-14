file = File.open(ARGV[0], "rb")
hapi_file = File.new(ARGV[1], "a+b")

if file
  file.each_line do
  |i|
    if i[0] == "/"
      puts i
      hapi_file.syswrite i
    end
  end
end