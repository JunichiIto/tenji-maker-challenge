# Difinition
# [                [
#   o, o              1,  2
#   o, o     =>       4,  8
#   o, o             16, 32
# ]                ]

class TenjiMaker
  BOIN = { 'A' => 1, 'I' => 5, 'U' => 3, 'E' => 7, 'O' => 6 }.freeze
  SHIIN = { 'K' => 32, 'S' => 40, 'T' => 24, 'N' =>16, 'H' => 48, 'M' => 56, 'R' => 8 }.freeze
  EXCEPTION = { 'YA' => 18, 'YU' => 50, 'YO' => 26, 'WA' => 16, 'N' => 56 }.freeze
  COMBI = SHIIN.map { |k1, v1| BOIN.map { |k2, v2| [k1+k2, v1+v2] } }.flatten(1).to_h.freeze

  # { 'A' => 1, 'I' => 5, ..., 'KA' => 33, 'KI' => 37, ..., 'N' => 56 }
  WORD_NUM_DICT = BOIN.merge(COMBI, EXCEPTION).freeze

  def to_tenji(text)
    tenji_list = text.split(' ').map do |word|
      six_bits = convert_word_to_six_bits word
      convert_bits_to_tenji six_bits
    end
    convert_tenji_lsit_to_tenji_template tenji_list
  end

  private

  # ex. 'A' => '100000'
  def convert_word_to_six_bits word
    sprintf('%06d', WORD_NUM_DICT[word].to_s(2)).reverse
  end

  # ex. '100000' => 'o-----'
  def convert_bits_to_tenji bits_s
    bits_s.chars.map { _1.to_i.zero? ? '-' : 'o' }.join
  end

  def convert_tenji_lsit_to_tenji_template tenji_list
    tenji_list.map { _1.scan(/.{1,#{2}}/) }.transpose.map { "#{_1.join(' ')}\n" }.join.chomp
  end
end
