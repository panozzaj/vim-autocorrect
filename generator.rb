output = File.open("autocorrect.vim", "w")
File.open("autocorrect.dat").each do |line|
  parts = line.chomp.split("->") # we don't want the line ending
  output.puts "ia #{parts[0]} #{parts[1]}"
  # if the words are already capitalized or the correction is capitalization, skip
  capitalized = parts[0].capitalize
  unless capitalized == parts[0] || capitalized == parts[1]
    output.puts "ia #{capitalized} #{parts[1].capitalize}"
  end
end
