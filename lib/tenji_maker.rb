class TenjiMaker
  ONE_LETTER = ['A', 'I', 'U', 'E', 'O', 'N']
  TENJI_INITIAL = ['-', '-', '-', '-', '-', '-']
  def to_tenji(text)
    split_text = text.split(' ')
    output = []
    split_text.length.times do
      output << TENJI_INITIAL.dup
    end

    split_text.each_with_index do |letter, index|
      mark_tenji(letter, output[index])
    end

    answer = []
    output.map{|o| answer << [o[0] + o[1], o[2] + o[3], o[4]+ o[5]]}

    answer = answer.transpose
    answer.each do |a|
      puts a.join(" ")
    end
  end
  def mark_tenji(letter, tenji_letter)
    case letter
    when 'YA'
      tenji_letter[1] = 'o'
      tenji_letter[4] = 'o'
      return
    when 'YU'
      tenji_letter[1] = 'o'
      tenji_letter[4] = 'o'
      tenji_letter[5] = 'o'
    when 'YO'
      tenji_letter[1] = 'o'
      tenji_letter[3] = 'o'
      tenji_letter[4] = 'o'
      return
    when 'WA'
      tenji_letter[4] = 'o'
      return
    end

    letter.each_char do |l|
      case l
      when 'A'
        tenji_letter[0] = 'o'
      when 'I'
        tenji_letter[0] = 'o'
        tenji_letter[2] = 'o'
      when 'U'
        tenji_letter[0] = 'o'
        tenji_letter[1] = 'o'
      when 'E'
        tenji_letter[0] = 'o'
        tenji_letter[1] = 'o'
        tenji_letter[2] = 'o'
      when 'O'
        tenji_letter[1] = 'o'
        tenji_letter[2] = 'o'
      when 'K'
        tenji_letter[5] = 'o'
      when 'S'
        tenji_letter[3] = 'o'
        tenji_letter[5] = 'o'
      when 'T'
        tenji_letter[3] = 'o'
        tenji_letter[5] = 'o'
      when 'N'
        tenji_letter[4] = 'o'
      when 'H'
        tenji_letter[4] = 'o'
        tenji_letter[5] = 'o'
      when 'M'
        tenji_letter[3] = 'o'
        tenji_letter[4] = 'o'
        tenji_letter[5] = 'o'
      when 'R'
        tenji_letter[3] = 'o'
      end
    end
  end
end

