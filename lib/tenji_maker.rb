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

      points_and_lines_made_from_alphabet_letters = romanisation_japanese_letter.split(//).map do |letter|
        vowel_points_needs_shift_downward_flag = true if CONSONANTS_NEEDS_VOWEL_POINTS_SHIFT_DOWNWARD.include?(letter)

        if VOWELS.has_key?(letter.to_sym)
          VOWELS[letter.to_sym]
        elsif CONSONANTS.has_key?(letter.to_sym)
          CONSONANTS[letter.to_sym]
        end
      end

      points_and_lines_made_from_alphabet_letters.compact!
      points_and_lines_made_from_alphabet_letters = vowel_points_and_lines_shift_downward(points_and_lines_made_from_alphabet_letters) if vowel_points_needs_shift_downward_flag
      compound_vowel_and_consonant_points_and_lines(points_and_lines_made_from_alphabet_letters)
    end
  end

  def format_to_tenjis(tenji_made_from_letters)
    tenjis = ["\n", "\n"]

    tenji_made_from_letters.each_with_index do |tenji, i|
      points_and_lines = tenji.split(//)

      unless last_letter?(tenji_made_from_letters, i)
        tenjis.insert((i)*3, points_and_lines[0], points_and_lines[1], "\ ")
        tenjis.insert((i)*6+4, points_and_lines[3], points_and_lines[4], "\ ")
        tenjis.insert((i)*9+8, points_and_lines[6], points_and_lines[7], "\ ")
      else
        tenjis.insert((i)*3, points_and_lines[0], points_and_lines[1])
        tenjis.insert((i)*6+3, points_and_lines[3], points_and_lines[4])
        tenjis.insert((i)*9+6, points_and_lines[6], points_and_lines[7])
      end
    end

    tenjis.join
  end

  def vowel_points_and_lines_shift_downward(points_and_lines_made_from_alphabet_letters)
    points_and_lines_made_from_alphabet_letters.map! do |points_and_lines_made_from_alphabet_letter|

      next points_and_lines_made_from_alphabet_letter unless VOWELS.value?(points_and_lines_made_from_alphabet_letter)

      slided_points_and_lines_made_from_alphabet_letter = ''
      MAXIMUM_TIMES_SHIFT_DOWNWARD.times do
        slided_points_and_lines_made_from_alphabet_letter = "--\n" + points_and_lines_made_from_alphabet_letter[0] + points_and_lines_made_from_alphabet_letter[1] + "\n" + points_and_lines_made_from_alphabet_letter[3] + points_and_lines_made_from_alphabet_letter[4]
        break slided_points_and_lines_made_from_alphabet_letter if slided_points_and_lines_made_from_alphabet_letter[6] == 'o'

        points_and_lines_made_from_alphabet_letter = slided_points_and_lines_made_from_alphabet_letter
      end

      slided_points_and_lines_made_from_alphabet_letter
    end
  end

  def compound_vowel_and_consonant_points_and_lines(points_and_lines_made_from_alphabet_letters)
    return points_and_lines_made_from_alphabet_letters[0] if points_and_lines_made_from_alphabet_letters[1].nil?

    dismantled_points_and_lines_made_from_alphabet_letters = points_and_lines_made_from_alphabet_letters.map { |points_and_lines_made_from_alphabet_letter| points_and_lines_made_from_alphabet_letter.split(//) }

    dismantled_consolnant_points_and_lines = dismantled_points_and_lines_made_from_alphabet_letters[0]
    dismantled_vowel_points_and_lines = dismantled_points_and_lines_made_from_alphabet_letters[1]

    points_and_lines_to_make_tenji = []
    
    LENGTH_OF_POINTS_AND_LINES_TO_TENJI.times do |num|
      points_and_lines_to_make_tenji[num] = compound_each_point_or_line(dismantled_consolnant_points_and_lines[num], dismantled_vowel_points_and_lines[num])
    end

    return points_and_lines_to_make_tenji.join
  end

  def compound_each_point_or_line(dismantled_consolnant_points_and_lines, dismantled_vowel_points_and_lines)
    return dismantled_consolnant_points_and_lines if dismantled_consolnant_points_and_lines == dismantled_vowel_points_and_lines

    'o'
  end

  def last_letter?(tenji_made_from_letters, i)
    tenji_made_from_letters.size - 1 == i
  end
end
