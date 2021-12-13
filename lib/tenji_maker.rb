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
    Y: '-o-',
    R: 'o--'
  }

  def to_tenji(text)
    roman_chars = text.split(' ')
    one_line_tenji_array = roman_chars.map do |roman_char|
      to_tenji_each_char(roman_char)
    end

    three_rows = split_three_row(one_line_tenji_array)
    three_rows.map { _1.join(' ') }.join("\n")
  end

  private

  def split_three_row(one_line_tenji_array)
    top, middle, bottom = Array.new(3) { [] }
    push_to_row = ->(row, tenji, start_point) { row << tenji[start_point, 2] }
    one_line_tenji_array.each do |one_line_tenji|
      push_to_row.call(top, one_line_tenji, 0)
      push_to_row.call(middle, one_line_tenji, 2)
      push_to_row.call(bottom, one_line_tenji, 4)
    end
    [top, middle, bottom]
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
