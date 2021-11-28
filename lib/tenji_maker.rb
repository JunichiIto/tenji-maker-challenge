# frozen_string_literal: true

# Class to raise error for invalid romaji
class InvalidRomaji < StandardError; end

# Class to convert romaji into braile consist of o-
class TenjiMaker
  # ref:
  # - japanese ubrl:
  # http://www.naiiv.net/braille/?tenji-sikumi
  # - kunrei-shiki romaji (ISO 3602)
  # https://ja.wikipedia.org/wiki/ISO_3602

  VOWEL = {
    'A' => { 1 => 'o', 2 => '-', 4 => '-' },
    'I' => { 1 => 'o', 2 => 'o', 4 => '-' },
    'U' => { 1 => 'o', 2 => '-', 4 => 'o' },
    'E' => { 1 => 'o', 2 => 'o', 4 => 'o' },
    'O' => { 1 => '-', 2 => 'o', 4 => 'o' }
  }.freeze
  CONSONANT = {
    'K' => { 3 => '-', 5 => '-', 6 => 'o' },
    'S' => { 3 => '-', 5 => 'o', 6 => 'o' },
    'T' => { 3 => 'o', 5 => 'o', 6 => '-' },
    'N' => { 3 => 'o', 5 => '-', 6 => '-' },
    'H' => { 3 => 'o', 5 => '-', 6 => 'o' },
    'M' => { 3 => 'o', 5 => 'o', 6 => 'o' },
    'R' => { 3 => '-', 5 => 'o', 6 => '-' }
  }.freeze
  EXCEPT = {
    'YA' => { 3 => 'o', 4 => 'o' },
    'YU' => { 3 => 'o', 4 => 'o', 6 => 'o' },
    'YO' => { 3 => 'o', 4 => 'o', 5 => 'o' },
    'WA' => { 3 => 'o' },
    'N' => { 3 => 'o', 5 => 'o', 6 => 'o' }
  }.freeze

  def to_tenji(text)
    ubrls = text.split("\s").map do
      ubrl = Hash[[*1..6].zip(['-'] * 6)]
      if EXCEPT.key?(_1)
        ubrl.merge!(EXCEPT[_1])
      elsif _1.size == 1 && VOWEL.key?(_1)
        ubrl.merge!(VOWEL[_1])
      elsif _1.size == 2 && VOWEL.key?(_1[1]) && CONSONANT.key?(_1[0])
        ubrl.merge!(VOWEL[_1[1]].merge(CONSONANT[_1[0]]))
      else
        raise InvalidRomaji, _1
      end
    end
    (1..3).map do |i|
      ubrls.map do |ubrl|
        ubrl[i] + ubrl[i + 3]
      end.join("\s")
    end.join("\n")
  end
end
