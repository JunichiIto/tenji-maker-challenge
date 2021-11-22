# frozen_string_literal: true

class Tenji
  attr_reader :squares

  def initialize(string)
    if exception_string?(string)
      @squares = EXCEPTION_LIST[string]
      return
    end

    @chars = string.chars
    @squares = []
    squares << build_squares_vowel
    squares << build_squares_consonant

    squares.flatten!
  end

  private

  attr_reader :chars

  def exception_string?(string)
    EXCEPTION_LIST.keys.find { |char, _| char == string }
  end

  def build_squares_vowel
    vowel = chars.last
    VOWLS_LIST[vowel]
  end

  def build_squares_consonant
    string_with_consonant = chars.length == 2
    return [] unless string_with_consonant

    consonant = chars.first
    CONSONAT_LIST[consonant]
  end

  VOWLS_LIST = {
    'A' => [1],
    'I' => [1, 2],
    'U' => [1, 4],
    'E' => [1, 2, 4],
    'O' => [2, 4]
  }.freeze

  CONSONAT_LIST = {
    'K' => [6],
    'S' => [5, 6],
    'T' => [3, 5],
    'N' => [3],
    'H' => [3, 6],
    'M' => [3, 5, 6],
    'R' => [5]
  }.freeze

  EXCEPTION_LIST = {
    'YA' => [3, 4],
    'YU' => [3, 4, 6],
    'YO' => [3, 4, 5],
    'WA' => [3],
    'N' => [3, 5, 6]
  }.freeze

  private_constant :VOWLS_LIST, :CONSONAT_LIST, :EXCEPTION_LIST
end
