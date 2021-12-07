# frozen_string_literal: true

class TenjiCharacter
  LETTER_NUMBER = {
    'A' => [1],
    'I' => [1, 2],
    'U' => [1, 4],
    'E' => [1, 2, 4],
    'O' => [2, 4],
    'YA' => [3, 4],
    'YU' => [3, 4, 6],
    'YO' => [3, 4, 5],
    'WA' => [3],
    'N' => [3, 5, 6]
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

  def initialize(letter)
    @letter = letter
  end

  def build
    default_characters = ['-', '-', '-', '-', '-', '-']
    read_number.each { |number| default_characters[number - 1] = 'o' }
    default_characters.join
  end

  def read_number
    consonant_letter? ? build_consonant_number : LETTER_NUMBER[@letter]
  end

  def consonant_letter?
    %w[K S T N H M R].any?(@letter[0])
  end

  def build_consonant_number
    CONSONANT_NUMBER[@letter[0]] + LETTER_NUMBER[@letter[1]]
  end
end
