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
    chars = text.split(' ')
    one_line_tenji_array = chars.map { |char| to_tenji_each_char(char) }

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

  def to_tenji_each_char(char)
    if char.size == 1
      case char
      when 'N'
        '---ooo'
      else
        VOWELS[char.to_sym] + '---'
      end
    else
      if char[0] == 'Y'
        CONSONANTS[:Y] +
          case char[1]
          when 'A'
            '-o-'
          when 'U'
            'oo-'
          when 'O'
            'oo-'
          end
      elsif char == 'WA'
        '----o-'
      else
        VOWELS[char[1].to_sym] + CONSONANTS[char[0].to_sym]
      end
    end
  end
end
