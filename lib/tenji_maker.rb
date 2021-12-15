#!/usr/bin/env ruby
# frozen_string_literal: true

class TenjiMaker
  NORMAL_LETTERS = {
    'A' => [0],
    'I' => [0, 2],
    'U' => [0, 1],
    'E' => [0, 1, 2],
    'O' => [1, 2],
    'K' => [5],
    'S' => [3, 5],
    'T' => [3, 4],
    'N' => [4],
    'H' => [4, 5],
    'M' => [3, 4, 5],
    'R' => [3]
  }.freeze

  SPECIAL_LETTERS = {
    'YA' => [1, 4],
    'YU' => [1, 4, 5],
    'YO' => [1, 3, 4],
    'WA' => [4],
    'NN' => [3, 4, 5]
  }.freeze

  def to_tenji(text)
    text_array = text.split.map(&:chars)
    braille_array = convert(text_array).map do |element|
      @braille_letter = +'------'
      make_braille(element)
      @braille_letter.scan(/.{1,2}/)
    end
    braille_array.transpose.map { |two_degits| two_degits.join(' ') }.join("\n")
  end

  private

  def convert(text_array)
    text_array.map do |first, second|
      second ||= first
      SPECIAL_LETTERS[first + second] || (NORMAL_LETTERS[first] | NORMAL_LETTERS[second])
    end
  end

  def make_braille(element)
    element.each do |number|
      @braille_letter[number] = 'o'
    end
  end
end

if __FILE__ == $PROGRAM_NAME
  text = ARGV[0]
  puts TenjiMaker.new.to_tenji(text)
end
