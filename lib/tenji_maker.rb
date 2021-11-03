class TenjiMaker
  LENGTH_TENJI_DOTS_AND_LINES_IN_ARRAY = 8

  VOWELS = {
    A: <<~A.chomp,
      o-
      --
      --
    A

    I: <<~I.chomp,
      o-
      o-
      --
    I

    U: <<~U.chomp,
      oo
      --
      --
    U

    E: <<~E.chomp,
      oo
      o-
      --
    E

    O: <<~O.chomp,
      -o
      o-
      --
    O
  }

  CONSONANTS = {
    K: <<~K.chomp,
      --
      --
      -o
    K

    S: <<~S.chomp,
      --
      -o
      -o
    S

    T: <<~T.chomp,
      --
      -o
      o-
    T

    N: <<~N.chomp,
      --
      --
      o-
    N

    H: <<~H.chomp,
      --
      --
      oo
    H

    M: <<~M.chomp,
      --
      -o
      oo
    M

    R: <<~R.chomp
      --
      -o
      --
    R
  }

  def to_tenji(text)
    alphabet_letter_tenjis = text.split(//).map do |letter|
      if VOWELS.has_key?(letter.to_sym)
        VOWELS[letter.to_sym]
      elsif CONSONANTS.has_key?(letter.to_sym)
        CONSONANTS[letter.to_sym]
      end
    end

    japanese_letter_tenji = compound_vowel_and_consonant_tenji(alphabet_letter_tenjis)
  end

  def compound_vowel_and_consonant_tenji(alphabet_letter_tenjis)
    return alphabet_letter_tenjis[0] if alphabet_letter_tenjis[1].nil?

    alphabet_letter_tenji_dots_and_lines = alphabet_letter_tenjis.map { |alphabet_letter_tenji| alphabet_letter_tenji.split(//) }

    consonant_tenji_dots_and_lines = alphabet_letter_tenji_dots_and_lines[0]
    vowel_tenji_dots_and_lines = alphabet_letter_tenji_dots_and_lines[1]

    japanese_letter_tenji_dots_and_lines = []
    
    LENGTH_TENJI_DOTS_AND_LINES_IN_ARRAY.times do |num|
      japanese_letter_tenji_dots_and_lines[num] = compound_each_dot_or_line(consonant_tenji_dots_and_lines[num], vowel_tenji_dots_and_lines[num])
    end

    return japanese_letter_tenji_dots_and_lines.join
  end

  def compound_each_dot_or_line(consonant_tenji_dot_or_line, vowel_tenji_dot_or_line)
    return consonant_tenji_dot_or_line if consonant_tenji_dot_or_line == vowel_tenji_dot_or_line

    return 'o'
  end
end
