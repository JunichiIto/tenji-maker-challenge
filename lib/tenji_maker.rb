class TenjiMaker
  LENGTH_OF_DOTS_AND_LINES_TO_TENJI = 8
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
    dots_and_lines_made_from_letters = dots_and_lines_build(text)
    format_to_tenji(dots_and_lines_made_from_letters)
  end

  private

  def dots_and_lines_build(text)
    text.split(' ').map do |romanisation_japanese_letter|
      vowel_tenji_inverse_flag = false

      if ROMANISATION_JAPANESE_LETTER_MEANS_N.include?(romanisation_japanese_letter)
        next TENJI_N_OR_NN
      end

      dots_and_lines_made_from_alphabet_letters = romanisation_japanese_letter.split(//).map do |letter|
        vowel_tenji_inverse_flag = true if CONSONANTS_NEEDS_VOWEL_TENJI_INVERSE.include?(letter)

        if VOWELS.has_key?(letter.to_sym)
          VOWELS[letter.to_sym]
        elsif CONSONANTS.has_key?(letter.to_sym)
          CONSONANTS[letter.to_sym]
        end
      end

      dots_and_lines_made_from_alphabet_letters.compact!
      dots_and_lines_made_from_alphabet_letters = vowel_dots_and_lines_slide_bottom(dots_and_lines_made_from_alphabet_letters) if vowel_tenji_inverse_flag
      compound_vowel_and_consonant_dots_and_lines(dots_and_lines_made_from_alphabet_letters)
    end
  end

  def format_to_tenji(dots_and_lines_made_from_letters)
    tenji = ["\n", "\n"]

    dots_and_lines_made_from_letters.each_with_index do |dots_and_lines_made_from_letter, i|
      dots_and_lines = dots_and_lines_made_from_letter.split(//)

      unless last_letter?(dots_and_lines_made_from_letters, i)
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

  def vowel_dots_and_lines_slide_bottom(dots_and_lines_made_from_alphabet_letters)
    dots_and_lines_made_from_alphabet_letters.map! do |dots_and_lines_made_from_alphabet_letter|

      next dots_and_lines_made_from_alphabet_letter unless VOWELS.value?(dots_and_lines_made_from_alphabet_letter)

      slided_dots_and_lines_made_from_alphabet_letter = ''
      MAXIMUM_TIMES_SHIFT_DOWNWARD.times do
        slided_dots_and_lines_made_from_alphabet_letter = "--\n" + dots_and_lines_made_from_alphabet_letter[0] + dots_and_lines_made_from_alphabet_letter[1] + "\n" + dots_and_lines_made_from_alphabet_letter[3] + dots_and_lines_made_from_alphabet_letter[4]
        break slided_dots_and_lines_made_from_alphabet_letter if slided_dots_and_lines_made_from_alphabet_letter[6] == 'o'

        dots_and_lines_made_from_alphabet_letter = slided_dots_and_lines_made_from_alphabet_letter
      end

      slided_dots_and_lines_made_from_alphabet_letter
    end
  end

  def compound_vowel_and_consonant_dots_and_lines(dots_and_lines_made_from_alphabet_letters)
    return dots_and_lines_made_from_alphabet_letters[0] if dots_and_lines_made_from_alphabet_letters[1].nil?

    dismantled_dots_and_lines_made_from_alphabet_letters = dots_and_lines_made_from_alphabet_letters.map { |dots_and_lines_made_from_alphabet_letter| dots_and_lines_made_from_alphabet_letter.split(//) }

    dismantled_consolnant_dots_and_lines = dismantled_dots_and_lines_made_from_alphabet_letters[0]
    dismantled_vowel_dots_and_lines = dismantled_dots_and_lines_made_from_alphabet_letters[1]

    dots_and_lines_to_make_tenji = []
    
    LENGTH_OF_DOTS_AND_LINES_TO_TENJI.times do |num|
      dots_and_lines_to_make_tenji[num] = compound_each_dot_or_line(dismantled_consolnant_dots_and_lines[num], dismantled_vowel_dots_and_lines[num])
    end

    return dots_and_lines_to_make_tenji.join
  end

  def compound_each_dot_or_line(dismantled_consolnant_dots_and_lines, dismantled_vowel_dots_and_lines)
    return dismantled_consolnant_dots_and_lines if dismantled_consolnant_dots_and_lines == dismantled_vowel_dots_and_lines

    'o'
  end

  def last_letter?(dots_and_lines_made_from_letters, i)
    dots_and_lines_made_from_letters.size - 1 == i
  end
end
