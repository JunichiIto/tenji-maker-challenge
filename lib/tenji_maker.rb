class TenjiMaker
  TENJI_INITIAL = ['-', '-', '-', '-', '-', '-']

  def to_tenji(text)
    split_text = text.split(' ')

    tenji_letters = set_tenji_initial(split_text.length)

    split_text.each_with_index do |letters, index|
      mark_tenji(letters, tenji_letters[index])
    end
    
    format_tenji_for_output(tenji_letters)
  end

  def mark_tenji(letters, tenji_letter)
    case letters
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
    when 'N'
      tenji_letter[3] = 'o'
      tenji_letter[4] = 'o'
      tenji_letter[5] = 'o'
      return
    end

    letters.each_char do |l|
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
        tenji_letter[4] = 'o'
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

  def set_tenji_initial(num)
    tenji_letters = []
    num.times do
      tenji_letters << TENJI_INITIAL.dup
    end
    tenji_letters
  end

  def format_tenji_for_output(tenji_letters)
    tenji_letters_for_output = []
    tenji_letters.map{|o| tenji_letters_for_output << [o[0] + o[1], o[2] + o[3], o[4]+ o[5]]}
    tenji_letters_for_output.transpose.map { |a| a.join(" ")}.join("\n")
  end
end