require 'constants'

class TenjiMaker
  include Constants

  def to_tenji(text)
    letters = text.split(' ')
    tenji_binary_letters = letters.map { |letter| letter_to_tenji_binary(letter) }
    tenji_binaries_matrix = tenji_binaries_to_matrix(tenji_binary_letters)
    matrix_to_tenji(tenji_binaries_matrix)
  end

  private

  def matrix_to_tenji(tenji_binaries_matrix)
    tenji_binaries_matrix.map { |binary_array|
      binary_array_to_tenji_line(binary_array)
    }.join("\n")
  end

  def binary_array_to_tenji_line(binary_array)
    binary_array.map { |bin|
      bin.inject('') { |result, b| result + binary_to_dot(b) }
    }.join(' ')
  end

  def binary_to_dot(binary)
    binary.zero? ? '-' : 'o'
  end

  def tenji_binaries_to_matrix(tenji_binaries)
    tenji_binaries.map { |letter|
      letter.each_slice(3).to_a.transpose
    }.transpose
  end

  def letter_to_tenji_binary(letter)
    return IRREGULARS[letter.to_sym] if letter.match?(/W|Y|N$/)

    consonant = CONSONANTS[letter[0].to_sym] || Array.new(6, 0)
    vowel = VOWELS[letter[-1].to_sym]

    [consonant, vowel].transpose.map { |a| a.inject(&:+) }.to_a
  end
end
