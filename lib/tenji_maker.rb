class TenjiMaker
  LENGTH_OF_POINTS_AND_LINES_TO_TENJI = 8
  MAXIMUM_TIMES_SHIFT_DOWNWARD = 2
  CONSONANTS_NEEDS_VOWEL_POINTS_SHIFT_DOWNWARD = ['Y', 'W']
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
    tenji_made_from_letters = build_tenjis(text)
    format_to_tenjis(tenji_made_from_letters)
  end

  private

  def build_tenjis(text)
    text.split(' ').map do |romanisation_japanese_letter|
      vowel_points_needs_shift_downward_flag = false

      if ROMANISATION_JAPANESE_LETTER_MEANS_N.include?(romanisation_japanese_letter)
        next TENJI_N_OR_NN
      end

      consornant_and_vowel_tenjis = romanisation_japanese_letter.split(//).map do |letter|
        vowel_points_needs_shift_downward_flag = true if CONSONANTS_NEEDS_VOWEL_POINTS_SHIFT_DOWNWARD.include?(letter)

        if VOWELS.has_key?(letter.to_sym)
          VOWELS[letter.to_sym]
        elsif CONSONANTS.has_key?(letter.to_sym)
          CONSONANTS[letter.to_sym]
        end
      end

      consornant_and_vowel_tenjis.compact!
      consornant_and_vowel_tenjis = vowel_tenji_shift_downward(consornant_and_vowel_tenjis) if vowel_points_needs_shift_downward_flag
      compound_consornant_and_vowel_tenjis(consornant_and_vowel_tenjis)
    end
  end

  def format_to_tenjis(tenji_made_from_letters)
    formatted_tenji = "\n\n"

    tenji_made_from_letters.each_with_index do |tenji, i|
      unless last_letter?(tenji_made_from_letters, i)
        formatted_tenji.insert((i)*3, tenji[0] + tenji[1] + "\ ")
        formatted_tenji.insert((i)*6+4, tenji[3] + tenji[4] + "\ ")
        formatted_tenji.insert((i)*9+8, tenji[6] + tenji[7] + "\ ")
      else
        formatted_tenji.insert((i)*3, tenji[0] + tenji[1])
        formatted_tenji.insert((i)*6+3, tenji[3] + tenji[4])
        formatted_tenji.insert((i)*9+6, tenji[6] + tenji[7])
      end
    end

    formatted_tenji
  end

  def vowel_tenji_shift_downward(consornant_and_vowel_tenjis)
    consornant_and_vowel_tenjis.map! do |consornant_or_vowel_tenji|

      next consornant_or_vowel_tenji unless VOWELS.value?(consornant_or_vowel_tenji)

      vowel_tenji = consornant_or_vowel_tenji
      shifted_vowel_tenji = ''

      MAXIMUM_TIMES_SHIFT_DOWNWARD.times do
        shifted_vowel_tenji = "--\n" + vowel_tenji[0] + vowel_tenji[1] + "\n" + vowel_tenji[3] + vowel_tenji[4]
        break shifted_vowel_tenji if shifted_vowel_tenji[6] == 'o' || shifted_vowel_tenji[7] == 'o'

        vowel_tenji = shifted_vowel_tenji
      end

      shifted_vowel_tenji
    end
  end

  def compound_consornant_and_vowel_tenjis(consornant_and_vowel_tenjis)
    return consornant_and_vowel_tenjis[0] if consornant_and_vowel_tenjis[1].nil?

    consornant_tenji = consornant_and_vowel_tenjis[0]
    vowel_tenji = consornant_and_vowel_tenjis[1]

    points_and_lines_of_tenji = ''
    
    LENGTH_OF_POINTS_AND_LINES_TO_TENJI.times do |num|
      points_and_lines_of_tenji[num] = compound_each_point_or_line(consornant_tenji[num], vowel_tenji[num])
    end

    return points_and_lines_of_tenji
  end

  def compound_each_point_or_line(consolnant_point_or_line, vowel_point_or_line)
    return consolnant_point_or_line if consolnant_point_or_line == vowel_point_or_line

    'o'
  end

  def last_letter?(tenji_made_from_letters, i)
    tenji_made_from_letters.size - 1 == i
  end
end
