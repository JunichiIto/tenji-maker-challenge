class TenjiMaker
  LENGTH_TENJI_DOTS_AND_LINES_IN_ARRAY = 8
  MAXIMUM_TIMES_SHIFT_DOWNWARD = 2
  CONSONANTS_NEEDS_VOWEL_TENJI_INVERSE = ['Y', 'W']
  ROMANISATION_JAPANESE_LETTER_MEANS_N = ['N', 'NN']

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

  TENJI_N_OR_NN = <<~TENJI_N_OR_NN.chomp
    --
    -o
    oo
  TENJI_N_OR_NN

  def to_tenji(text)
    continuity_dots_and_lines = continuity_dots_and_lines_build(text)
    format_to_tenji(continuity_dots_and_lines)
  end

  private

  def continuity_dots_and_lines_build(text)
    text.split(' ').map do |romanisation_japanese_letter|
      vowel_tenji_inverse_flag = false

      unless ROMANISATION_JAPANESE_LETTER_MEANS_N.grep(romanisation_japanese_letter).empty?
        next TENJI_N_OR_NN
      end

      alphabet_letter_tenjis = romanisation_japanese_letter.split(//).map do |letter|
        vowel_tenji_inverse_flag = true unless CONSONANTS_NEEDS_VOWEL_TENJI_INVERSE.grep(letter).empty?

        if VOWELS.has_key?(letter.to_sym)
          VOWELS[letter.to_sym]
        elsif CONSONANTS.has_key?(letter.to_sym)
          CONSONANTS[letter.to_sym]
        end
      end

      alphabet_letter_tenjis.compact!
      alphabet_letter_tenjis = vowel_tenji_slide_bottom(alphabet_letter_tenjis) if vowel_tenji_inverse_flag
      japanese_letter_tenji = compound_vowel_and_consonant_tenji(alphabet_letter_tenjis)
    end
  end

  def format_to_tenji(continuity_dots_and_lines)
    tenji = ["\n", "\n"]

    continuity_dots_and_lines.each_with_index do |continuity_dot_and_line, i|
      dots_and_lines = continuity_dot_and_line.split(//)

      if continuity_dots_and_lines.size - 1 != i
        tenji.insert((i)*3, dots_and_lines[0], dots_and_lines[1], "\ ")
        tenji.insert((i)*6+4, dots_and_lines[3], dots_and_lines[4], "\ ")
        tenji.insert((i)*9+8, dots_and_lines[6], dots_and_lines[7], "\ ")
      else
        tenji.insert((i)*3, dots_and_lines[0], dots_and_lines[1])
        tenji.insert((i)*6+3, dots_and_lines[3], dots_and_lines[4])
        tenji.insert((i)*9+6, dots_and_lines[6], dots_and_lines[7])
      end
    end

    tenji.join
  end

  def vowel_tenji_slide_bottom(alphabet_letter_tenjis)
    alphabet_letter_tenjis.map! do |alphabet_letter_tenji|

      next alphabet_letter_tenji unless VOWELS.value?(alphabet_letter_tenji)

      slided_alphabet_letter_tenji = ''
      MAXIMUM_TIMES_SHIFT_DOWNWARD.times do
        slided_alphabet_letter_tenji = "--\n" + alphabet_letter_tenji[0] + alphabet_letter_tenji[1] + "\n" + alphabet_letter_tenji[3] + alphabet_letter_tenji[4]
        break slided_alphabet_letter_tenji if slided_alphabet_letter_tenji[6] == 'o'

        alphabet_letter_tenji = slided_alphabet_letter_tenji
      end

      slided_alphabet_letter_tenji
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
