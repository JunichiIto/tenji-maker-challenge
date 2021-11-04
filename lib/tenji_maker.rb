class TenjiMaker
  LENGTH_TENJI_DOTS_AND_LINES_IN_ARRAY = 8
  CONSONANTS_NEEDS_VOWEL_TENJI_INVERSE = ['Y', 'W']

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

    Y: <<~Y.chomp,
      -o
      --
      --
    Y

    R: <<~R.chomp
      --
      -o
      --
    R
  }

  def to_tenji(text)
    vowel_tenji_inverse_flag = false

    alphabet_letter_tenjis = text.split(//).map do |letter|
      vowel_tenji_inverse_flag = true unless CONSONANTS_NEEDS_VOWEL_TENJI_INVERSE.grep(letter).empty?

      if VOWELS.has_key?(letter.to_sym)
        VOWELS[letter.to_sym]
      elsif CONSONANTS.has_key?(letter.to_sym)
        CONSONANTS[letter.to_sym]
      end
    end

    alphabet_letter_tenjis.compact!
    alphabet_letter_tenjis = vowel_tenji_inverse(alphabet_letter_tenjis) if vowel_tenji_inverse_flag
    japanese_letter_tenji = compound_vowel_and_consonant_tenji(alphabet_letter_tenjis)
  end

  def vowel_tenji_inverse(alphabet_letter_tenjis)
    alphabet_letter_tenjis.map! do |alphabet_letter_tenji|

      next alphabet_letter_tenji unless VOWELS.value?(alphabet_letter_tenji)

      alphabet_letter_tenji[6] + alphabet_letter_tenji[7] + alphabet_letter_tenji[2..5] + alphabet_letter_tenji[0] + alphabet_letter_tenji[1]
    end
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
