class TenjiMaker
  Vowels = {
    A: 'o--',
    I: 'o-o',
    U: 'oo-',
    E: 'ooo',
    O: '-oo'
  }

  Consonants = {
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
    tenji_array = chars.map { |char| to_tenji_each_char(char) }

    top, middle, bottom = Array.new(3) { [] }
    tenji_array.each do |t|
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
      tenji = ''
      case char
      when 'N'
        tenji = '---ooo'
      else
        tenji = Vowels[char.to_sym]
      end
      tenji += '---'
    else
      if char[0] == 'Y'
        case char[1]
        when 'A'
          Consonants[char[0].to_sym] + '-o-'
        when 'U'
          Consonants[char[0].to_sym] + 'oo-'
        when 'O'
          p Consonants[char[0].to_sym] + 'oo-'
        end
      elsif char == 'WA'
        '----o-'
      else
        Vowels[char[1].to_sym] + Consonants[char[0].to_sym]
      end
    end
  end
end
