# frozen_string_literal: true

class TenjiMaker
  FIRST_CONVERSION_TABLE = {
    'A' => [0],
    'I' => [0, 1],
    'U' => [0, 3],
    'E' => [0, 1, 3],
    'O' => [1, 3],
    'N' => [2, 4, 5],
    'Y' => [3]
  }.freeze

  SECOND_CONVERSION_TABLE = {
    'K' => [5],
    'S' => [4, 5],
    'T' => [2, 4],
    'N' => [2],
    'H' => [2, 5],
    'M' => [2, 4, 5],
    'R' => [4],
    'W' => [2],
    'A' => [2],
    'U' => [2, 5],
    'O' => [2, 4]
  }.freeze

  def to_tenji(text)
    moras = text.split(' ')
    squares = dot(moras)
    formatted_tenji(squares)
  end

  private

  def dot(moras)
    moras.map do |mora|
      square = Array.new(6) { '-' }
      first_char, second_char = mora.start_with?(/[WY]/) ? mora.split('') : mora.split('').reverse

      FIRST_CONVERSION_TABLE[first_char]&.each { |i| square[i] = 'o' }
      SECOND_CONVERSION_TABLE[second_char]&.each { |i| square[i] = 'o' }
      square
    end
  end

  def formatted_tenji(squares)
    transposed_squares = squares.map { |square| square.each_slice(3).to_a.transpose.map(&:join) }
    transposed_squares.transpose.map { |rows| rows.join(' ') }.join("\n")
  end
end
