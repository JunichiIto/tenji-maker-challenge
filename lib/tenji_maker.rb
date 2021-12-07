class TenjiMaker
  VOWELS = {
    A: 'o--',
    I: 'o-o',
    U: 'oo-',
    E: 'ooo',
    O: '-oo'
  }

  CONSONANTS = {
    K: '--o',
    S: 'o-o',
    T: 'oo-',
    N: '-o-',
    H: '-oo',
    M: 'ooo',
    R: 'o--',
    Y: '-o-',
    W: '---'
  }

  def to_tenji(text)
    roman_chars = text.split(' ')
    one_line_tenji_array = roman_chars.map { |roman_char| to_tenji_each_char(roman_char) }

    top, middle, bottom = split_three_row(one_line_tenji_array)

    output = {}
    output[:top] = top.join(' ')
    output[:middle] = middle.join(' ')
    output[:bottom] = bottom.join(' ')

    <<~TENJI.chomp
      #{output[:top]}
      #{output[:middle]}
      #{output[:bottom]}
    TENJI
  end

  private

  def split_three_row(one_line_tenji_array)
    top, middle, bottom = Array.new(3) { [] }
    push_to_row = ->(row, tenji, start_point) { row << tenji[start_point, 2] }
    one_line_tenji_array.each do |t|
      push_to_row.call(top, t, 0)
      push_to_row.call(middle, t, 2)
      push_to_row.call(bottom, t, 4)
    end
    return top, middle, bottom
  end

  def to_tenji_each_char(roman_char)
    if roman_char.size == 1
      roman_char == 'N' ? '---ooo' : VOWELS[roman_char.to_sym] + '---'
    elsif roman_char.size == 2
      consonant, vowel = roman_char.chars
      if consonant == 'Y'
        CONSONANTS[:Y] +
          case vowel
          when 'A'
            '-o-'
          when 'U'
            '-oo'
          when 'O'
            'oo-'
          end
      elsif roman_char == 'WA'
        '----o-'
      else
        VOWELS[vowel.to_sym] + CONSONANTS[consonant.to_sym]
      end
    end
  end
end
