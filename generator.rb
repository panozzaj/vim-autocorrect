# Seems like doing some actual unit tests would be advisable,
# but leaving for now. The examples are all there, should be easy to extract.
class Generator
  def generate
    output = File.open("plugin/autocorrect.vim", "w")
    write output, "function! AutoCorrect()"
    File.open("autocorrect.dat").each do |line|
      parts = line.chomp.split("->") # we don't want the line ending
      wrong = parts[0]
      right = parts[1]

      write output, basic_correction(wrong, right)
      write output, capitalized_correction(wrong, right)
      write output, capitalization_correction(wrong, right)
      write output, first_two_letters_correction(wrong, right)
    end
    write output, "endfunction"
  end

  def write(output, s)
    output.puts s unless s.nil?
  end

  # Ruby's capitalize doesn't quite do what we want for wifi->Wi-Fi,
  # since "Wi-Fi".capitalize => "Wi-fi"
  def capitalize(s)
    s[0..0].upcase + s[1..-1]
  end

  def capitalize_first_two(s)
    s[0..1].upcase + s[2..-1]
  end

  def capitalized?(s)
    s == capitalize(s)
  end

  # ex: teh->the
  #  =  teh->teh
  # ex: Bernouilli->Bernoulli
  #  =  Bernouilli->Bernoulli
  def basic_correction(wrong, right)
    "ia #{wrong} #{right}"
  end

  # ex: teh -> the
  #  =  Teh -> The
  def capitalized_correction(wrong, right)
    capitalized = capitalize wrong
    # if the words are already capitalized or the correction _is_ capitalization, skip
    unless capitalized == wrong || capitalized == right
      "ia #{capitalized} #{capitalize right}"
    end
  end

  # ex: Bernouilli->Bernoulli
  #  =  bernouilli->Bernoulli
  def capitalization_correction(wrong, right)
    if capitalized?(right) && capitalized?(wrong)
      "ia #{wrong.downcase} #{right}"
    end
  end

  # ex: teh->the
  #  =  TEh->The
  # ex: Bernouilli->Bernoulli
  #  =  BErnouilli->Bernoulli
  def first_two_letters_correction(wrong, right)
    if wrong.length > 2 && right.length > 2
        wrong != capitalize_first_two(wrong) &&
        right != capitalize_first_two(right)
      "ia #{capitalize_first_two(wrong)} #{capitalize right}"
    end
  end
end

Generator.new.generate
