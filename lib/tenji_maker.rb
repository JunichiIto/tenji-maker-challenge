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

    top, middle, bottom = Array.new(3) { [] }
    one_line_tenji_array.each do |t|
      top << t[0, 2]
      middle << t[2, 2]
      bottom << t[4, 2]
    end

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
