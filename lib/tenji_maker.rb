# frozen_string_literal: true

class TenjiMaker
  TRANS_TABLE = {
    'A' => 0b100000,
    'I' => 0b110000,
    'U' => 0b100100,
    'E' => 0b110100,
    'O' => 0b010100,
    'K' => 0b000001,
    'S' => 0b000011,
    'T' => 0b001010,
    'N' => 0b001000,
    'H' => 0b001001,
    'M' => 0b001011,
    'R' => 0b000010,
    'G' => 0b000010_000001,
    'Z' => 0b000010_000011,
    'D' => 0b000010_001010,
    'B' => 0b000010_001001,
    'P' => 0b000001_001001,
    'Y' => 0b000100_000000
  }.freeze

  EXCEPTION_TABLE = {
    'YA' =>  0b001100,
    'YU' =>  0b001101,
    'YO' =>  0b001110,
    'WA' =>  0b001000,
    'WO' =>  0b001010,
    'N' =>   0b001011,
    'XTU' => 0b010000,
    '-'   => 0b010010,
    '.'   => 0b010011
  }.freeze

  BASE64 = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'

  def to_tenji(text)
    to_binaries(text).map { |binary| binary_to_tenji(binary).lines(chomp: true) }
                     .transpose.map { _1.join(" ") }.join("\n")
  end

  # ２進数値を、点字に変換
  def binary_to_tenji(binary)
    format("%06b", binary).tr("01", "-o").chars.each_slice(3).to_a.transpose.map(&:join).join("\n")
  end

  # 与えられた文字列を、点字に対応する２進数値の配列に変換
  def to_binaries(text)
    binaries = text.split.map do |syllable|
      EXCEPTION_TABLE[syllable] || syllable.chars.map { |char| TRANS_TABLE[char] }.inject(:|)
    end
    binaries.map { _1 > 0b111111 ? [_1 >> 6, _1 & 0b111111] : _1 }.flatten
  end

  # 文字列を、その点字に対応する BASE64 文字列に変換
  def to_base64(text)
    to_binaries(text).map { BASE64[_1] }.join
  end
end
