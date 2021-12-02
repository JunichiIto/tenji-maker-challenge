# frozen_string_literal: true

class TenjiNumber
  VOWEL_NUMBER = {
    'A' => [1],
    'I' => [1, 2],
    'U' => [1, 4],
    'E' => [1, 2, 4],
    'O' => [2, 4]
  }.freeze

  CONSONANT_NUMBER = {
    'K' => [6],
    'S' => [5, 6],
    'T' => [3, 5],
    'N' => [3],
    'H' => [3, 6],
    'M' => [3, 5, 6],
    'R' => [5]
  }.freeze

  OTHER_LETTER_NUMBER = {
    'YA' => [3, 4],
    'YU' => [3, 4, 6],
    'YO' => [3, 4, 5],
    'WA' => [3],
    'N' => [3, 5, 6]
  }.freeze

  def initialize(letters)
    @letters = letters
  end

  def convert_to_number
    @letters.map do |letter|
      if other_letter?(letter)
        OTHER_LETTER_NUMBER[letter]
      elsif vowel?(letter)
        VOWEL_NUMBER[letter]
      else
        build_number(letter)
      end
    end
  end

  private

  def other_letter?(letter)
    other_letters = %w[YA YU YO WA N]
    other_letters.any?(letter)
  end

  def vowel?(letter)
    vowels = %w[A I U E O]
    vowels.any?(letter)
  end

  def build_number(letter)
    consonant = CONSONANT_NUMBER[letter[0]]
    vowel = VOWEL_NUMBER[letter[1]]
    vowel + consonant
  end
end
