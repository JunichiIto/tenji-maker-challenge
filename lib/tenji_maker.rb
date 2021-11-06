class TenjiMaker
  CharToNum = {
    "a" => 8, "i" => 24, "u" => 40, "e" => 56, "o" => 48,
    "k" => 1, "s" => 3, "t" => 6, "n" => 4, "h" => 5, "m" => 7, "y" => 59, "r" => 2, "w" => 57,
  }

  Format = [5, 3, 4, 0, 2, 1]
  YWFormat = [4, 1, 2, 3, 5]

  def to_tenji(text)
    text.downcase.split(" ").map { |t| string_to_tenji(t) }.transpose.map{|t| t.join(" ")}.join("\n")
  end

  def string_to_tenji(string)
    num_to_tenji(string.chars.inject(0) { |r, i| r + CharToNum[i] })
  end

  def num_to_tenji(num)
    array = [0,0,0,0,0,0]

    num = CharToNum["m"] if num == CharToNum["n"]
    (num & 64 == 0 ? Format : YWFormat).each do |f|
      array[f] = 1 if num & 1 == 1
      num = num >> 1
    end

    array_to_tenji(array)
  end

  def array_to_tenji(array)
    array.each_slice(2).map {|a| a.inject(""){ |r, i| r + (i == 1 ? "o" : "-")}}
  end
end
