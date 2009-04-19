output = File.open("autocorrect.vim", "w")
File.open("autocorrect.dat").each do |line|
  parts = line.split("->")
  output.puts "iabbrev #{parts[0]} #{parts[1]}"
  if parts[0].capitalize != parts[0]
    output.puts "iabbrev #{parts[0].capitalize} #{parts[1].capitalize}"
  end
end
