class TenjiMaker
  DOT = 'o'.freeze
  DASH = '-'.freeze

  Point = Struct.new(:i, :j)
  ZERO_ZERO, ZERO_ONE = Point.new(0, 0), Point.new(0, 1)
  ONE_ZERO, ONE_ONE = Point.new(1, 0), Point.new(1, 1)
  TWO_ZERO, TWO_ONE = Point.new(2, 0), Point.new(2, 1)

  def to_tenji(text)
    result = text.split.map do |s|
      /(?<consonant>[KSTNHMYRW]|)(?<vowel>[AIUEO]|)/ =~ s
      tenji_unit = [
        [DASH, DASH],
        [DASH, DASH],
        [DASH, DASH]
      ]
      !consonant.empty? && \
        _points_consonant(consonant, vowel)&.each { |point| tenji_unit[point.i][point.j] = DOT }
      !vowel.empty? && \
        _points_vowel(consonant, vowel).each { |point| tenji_unit[point.i][point.j] = DOT }
      tenji_unit
    end
    _to_string(result)
  end

  private

  def _points_consonant(consonant, vowel)
    case consonant
    when 'K'; [TWO_ONE]
    when 'S'; [ONE_ONE, TWO_ONE]
    when 'T'; [ONE_ONE, TWO_ZERO]
    when 'N'; vowel.empty? ? [ONE_ONE, TWO_ZERO, TWO_ONE] : [TWO_ZERO]
    when 'H'; [TWO_ZERO, TWO_ONE]
    when 'M'; [ONE_ONE, TWO_ZERO, TWO_ONE]
    when 'Y'; [ZERO_ONE]
    when 'R'; [ONE_ONE]
    when 'W'; nil
    end
  end

  def _points_vowel(consonant, vowel)
    if %w[W Y].include?(consonant)
      case vowel
      when 'A'; [TWO_ZERO]
      when 'U'; [TWO_ZERO, TWO_ONE]
      when 'O'; [ONE_ONE, TWO_ZERO]
      end
    else
      case vowel
      when 'A'; [ZERO_ZERO]
      when 'I'; [ZERO_ZERO, ONE_ZERO]
      when 'U'; [ZERO_ZERO, ZERO_ONE]
      when 'E'; [ZERO_ZERO, ZERO_ONE, ONE_ZERO]
      when 'O'; [ZERO_ONE, ONE_ZERO]
      end
    end
  end

  def _to_string(result)
    line1, line2, line3 = '', '', ''
    result.each do |tenji_unit|
      line1 += "#{tenji_unit[0][0]}#{tenji_unit[0][1]} "
      line2 += "#{tenji_unit[1][0]}#{tenji_unit[1][1]} "
      line3 += "#{tenji_unit[2][0]}#{tenji_unit[2][1]} "
    end
    "#{line1.strip}\n#{line2.strip}\n#{line3.strip}"
  end
end
