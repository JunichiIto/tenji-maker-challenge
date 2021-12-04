require 'constants'

class TenjiMaker
  def to_tenji(text)
    # 以下はサンプルの仮実装なので、このcase文は全部消して自作ロジックに書き直すこと
    case text
    when 'A HI RU'
      <<~TENJI.chomp
        o- o- oo
        -- o- -o
        -- oo --
      TENJI
    when 'KI RI N'
      <<~TENJI.chomp
        o- o- --
        o- oo -o
        -o -- oo
      TENJI
    when 'SI MA U MA'
      <<~TENJI.chomp
        o- o- oo o-
        oo -o -- -o
        -o oo -- oo
      TENJI
    when 'NI WA TO RI'
      <<~TENJI.chomp
        o- -- -o o-
        o- -- oo oo
        o- o- o- --
      TENJI
    when 'HI YO KO'
      <<~TENJI.chomp
        o- -o -o
        o- -o o-
        oo o- -o
      TENJI
    when 'KI TU NE'
      <<~TENJI.chomp
        o- oo oo
        o- -o o-
        -o o- o-
      TENJI
    end
  end

  private

  def to_tenji_binary_leter(letter)
    return IRREGULARS[letter.to_sym] if letter.match?(/W|Y|N/)

    vowel = letter[-1]
    if letter.length == 1
      VOWELS[vowel.to_sym].concat([0, 0, 0])
    else
      consonant = letter[0]
      VOWELS[vowel.to_sym].concat(CONSONANTS[consonant.to_sym])
    end
  end
end
