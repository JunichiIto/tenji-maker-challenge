# frozen_string_literal: true

# Build braille characters.
class TenjiCharacter
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

  FIXED_LETTER_NUMBER = {
    'YA' => [3, 4],
    'YU' => [3, 4, 6],
    'YO' => [3, 4, 5],
    'WA' => [3],
    'N' => [3, 5, 6]
  }.freeze

  def initialize(letter)
    @letter = letter
  end

  def build_character
    default_characters = ['-', '-', '-', '-', '-', '-']
    tenji_numbers = search_tenji_numbers
    tenji_numbers.each { |number| default_characters[number - 1] = 'o' }
    default_characters.join
  end

  private

  def search_tenji_numbers
    if fixed_letter?
      FIXED_LETTER_NUMBER[@letter]
    else
      contain_consonant? ? build_consonant : VOWEL_NUMBER[@letter]
    end
  end

  def fixed_letter?
    %w[YA YU YO WA N].any?(@letter)
  end

  def contain_consonant?
    %w[K S T N H M R].any?(@letter[0])
  end

  def build_consonant
    CONSONANT_NUMBER[@letter[0]] + VOWEL_NUMBER[@letter[1]]
  end
end
