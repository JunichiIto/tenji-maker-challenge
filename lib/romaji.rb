require 'tenji_map'

class Romaji
  include TenjiMap

  attr_accessor :char

  def initialize(char)
    @char = char
  end

  def length
    char.length
  end

  # 母音(末尾の文字)
  def vowel
    char[-1]
  end

  # 子音(2文字以上の場合は末尾の文字だけ除けば子音となる)
  def consonant
    length >= 2 ? char[0..-2] : ''
  end

  # ローマ字から点字情報を作成する
  # @param [Romaji] ローマ字('HA', 'N', etc..)
  # @return [Hash]
  # e.g.) ti(ち)の場合
  # {
  #   1 => 'o', 4 => '-',
  #   2 => 'o', 5 => 'o',
  #   3 => 'o', 6 => '-',
  #  }
  def tenji_block
    # 規則性がないローマ字の場合は点字情報を指定して返却
    return UNIQUE[char] if UNIQUE.keys.include?(char)

    # 初期値(全て'-')
    tenji = BLANK.dup

    # 母音の点字情報を反映
    tenji.merge!(VOWEL[vowel])

    # 子音の点字情報を反映
    tenji.merge!(CONSONANT[consonant] || {})
  end
end
