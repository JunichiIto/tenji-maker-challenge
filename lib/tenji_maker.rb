class TenjiMaker
  TextToNum = {
    "a" => 8, "i" => 40, "u" => 24, "e" => 56, "o" => 48,
    "k" => 1, "s" => 3, "t" => 6, "n" => 4, "h" => 5, "m" => 7, "y" => 59, "r" => 2, "w" => 57,
  }

  Format = [5, 3, 4, 0, 1, 2]
  YWFormat = [4, 1, 2, 3, 5]

  def to_tenji(text)
    text.downcase.split(" ").map do |t|
      array_to_tenji(num_to_array(text_to_num(t)))
    end.transpose.map{|t| t.join(" ")}.join("\n")
  end

  def text_to_num(text)
    text.chars.inject(0) { |r, i| r + TextToNum[i] }
  end

  def num_to_array(num)
    return [0,0,0,1,1,1] if num == 4

    array = [0,0,0,0,0,0]
    (num & 64 == 0 ? Format : YWFormat).each do |f|
      if num & 1 == 1
        array[f] = 1
      end
      num = num >> 1
    end

    array
  end

  def array_to_tenji(array)
    array.each_slice(2).map do |a|
      a.inject(""){ |r, i| r + (i == 1 ? "o" : "-")}
    end
  end
end
