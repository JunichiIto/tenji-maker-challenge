class TenjiMaker
  DOT = 'o'.freeze
  DASH = '-'.freeze

  def to_tenji(text)
    result = []
    text.split(' ').each do |s|
      # 出力する点字の最小単位
      # --
      # --
      # --
      # を 3 x 2の行列とみなす
      initial_state = Array.new(3) { Array.new(2, DASH) }
      if s.include?('A')
        initial_state[0][0] = DOT
      elsif s.include?('I')
        initial_state[0][0] = DOT
        initial_state[1][0] = DOT
      elsif s.include?('U')
        initial_state[0][0] = DOT
        initial_state[0][1] = DOT
      elsif s.include?('E')
        initial_state[0][0] = DOT
        initial_state[0][1] = DOT
        initial_state[1][0] = DOT
      elsif s.include?('O')
        initial_state[0][1] = DOT
        initial_state[1][0] = DOT
      end
      result << initial_state
    end
    matrix_to_string(result)
  end

  private

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
