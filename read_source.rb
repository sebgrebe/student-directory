#Program reads its own source code and prints it to the screen
own_name = $0
File.open(own_name,"r") do |file|
  file.readlines.each do |line|
    puts line
  end
end
