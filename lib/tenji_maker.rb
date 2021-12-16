class TenjiMaker
  TENJI_INITIAL = ['-', '-', '-', '-', '-', '-']
  TENJI_EXCEPTIONAL = {'YA' => [2,3], 'YU' => [2,3,5], 'YO' => [2,3,4], 'WA' => [2], 'N' => [2,4,5]}
  TENJI_NORMAL = {'A' => [0], 'I' => [0,1], 'U' => [0,3], 'E' => [0,1,3], 'O' => [1,3], 'K' => [5], 'S' => [4,5], 'T' => [2,4], 'N' => [2], 'H' => [2,5], 'M' => [2,4,5], 'R' => [4]}

  def to_tenji(text)
    split_text = text.split(' ')

    tenji_letters = set_tenji_initial(split_text.length)

    split_text.each_with_index do |letters, index|
      if TENJI_EXCEPTIONAL.keys.include?(letters)
        mark_tenji_exceptional(letters, tenji_letters[index])
      else
        mark_tenji_normal(letters, tenji_letters[index])
      end
    end
    format_tenji_for_output(tenji_letters)
  end

  def mark_tenji_exceptional(letters, tenji_letter)
    TENJI_EXCEPTIONAL[letters].map{ |num| tenji_letter[num] = 'o'}
  end

  def mark_tenji_normal(letters, tenji_letter)
    letters.each_char do |letter|
      TENJI_NORMAL[letter].map{ |num| tenji_letter[num] = 'o'}
    end

  end

  def set_tenji_initial(num)
    tenji_letters = []
    num.times do
      tenji_letters << TENJI_INITIAL.dup
    end
    tenji_letters
  end

  def format_tenji_for_output(tenji_letters)
    tenji_letters_for_output = []
    tenji_letters.map{ |letter| tenji_letters_for_output << [letter[0] + letter[3], letter[1] + letter[4], letter[2]+ letter[5]]}
    tenji_letters_for_output.transpose.map { |a| a.join(" ")}.join("\n")
  end

end
