class TenjiMaker
  DOT = 'o'.freeze
  DASH = '-'.freeze

  def to_tenji(text)
    result = []
    text.split(' ').each do |s|
      /(?<consonant>[KSTNHMYRW]|)(?<vowel>[AIUEO]|)/ =~ s
      initial_state = three_row_two_column
      consonant && assign_consonant(initial_state, consonant, vowel)
      vowel && assign_vowel(initial_state, vowel)
      result << initial_state
    end
    matrix_to_string(result)
  end

  private

  # 出力する点字の最小単位
  # --
  # --
  # --
  # を 3 x 2の行列とみなす
  def three_row_two_column
    # [0][0][0][1]
    # [1][0][1][1]
    # [2][0][2][1]
    Array.new(3) { Array.new(2, DASH) }
  end

  def assign_consonant(initial_state, consonant, vowel)
    case consonant
    when 'K'
      initial_state[2][1] = DOT
    when 'S'
      initial_state[1][1] = DOT
      initial_state[2][1] = DOT
    when 'T'
      initial_state[2][0] = DOT
      initial_state[1][1] = DOT
    when 'N'
      initial_state[2][0] = DOT
      if vowel.empty?
        initial_state[1][1] = DOT
        initial_state[2][1] = DOT
      end
    when 'H'
      initial_state[2][0] = DOT
      initial_state[2][1] = DOT
    when 'M'
      initial_state[2][0] = DOT
      initial_state[1][1] = DOT
      initial_state[2][1] = DOT
    when 'Y'
      # TODO
    when 'R'
      initial_state[1][1] = DOT
    when 'W'
      # TODO
    end
  end

  def assign_vowel(initial_state, vowel)
    case vowel
    when 'A'
      initial_state[0][0] = DOT
    when 'I'
      initial_state[0][0] = DOT
      initial_state[1][0] = DOT
    when 'U'
      initial_state[0][0] = DOT
      initial_state[0][1] = DOT
    when 'E'
      initial_state[0][0] = DOT
      initial_state[0][1] = DOT
      initial_state[1][0] = DOT
    when 'O'
      initial_state[0][1] = DOT
      initial_state[1][0] = DOT
    end
  end

  def matrix_to_string(result)
    line1 = ''
    line2 = ''
    line3 = ''
    result.each do |x|
      line1 += "#{x[0][0]}#{x[0][1]} "
      line2 += "#{x[1][0]}#{x[1][1]} "
      line3 += "#{x[2][0]}#{x[2][1]} "
    end
    "#{line1.strip}\n#{line2.strip}\n#{line3.strip}"
  end
end
