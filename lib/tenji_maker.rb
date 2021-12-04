require 'constants'
require 'byebug'

class TenjiMaker
  def to_tenji(text)
    letters = text.split(' ')
    binary_letters = letters.map { |letter| to_tenji_binary_leter(letter) }
    binary_letters.transpose.inject([]) { |result, item|
      result << to_tenji_line(item)
    }.join("\n")
  end

  private

  # NOTE: 文字から３行2列で点の有無を1,0で表現した点字用の行列を作成
  # 例) "KI" => [[1, 0], [1, 0], [0, 1]]
  def to_tenji_binary_leter(letter)
    return IRREGULARS[letter.to_sym].each_slice(2).to_a if letter.match?(/W|Y|N$/)

    vowel = letter[-1]
    if letter.length == 1
      VOWELS[vowel.to_sym] + [0, 0, 0]
    else
      consonant = letter[0]
      VOWELS[vowel.to_sym] + CONSONANTS[consonant.to_sym]
    end.each_slice(2).to_a
  end

  def to_dot(int)
    case int
    when 0
      '-'
    when 1
      'o'
    end
  end

  def to_tenji_line(binary_line)
    binary_line.inject([]) { |result, item|
      result << item.inject('') { |r, binary| r + to_dot(binary) }
    }.join(' ')
  end
end
