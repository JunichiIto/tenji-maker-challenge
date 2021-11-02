require 'constant'

module TenjiBlock
  include Constant
  # ローマ字を引数に点字情報をHashに格納する
  # @param [Romaji] ローマ字('HA', 'N', etc..)
  # @return [Hash]
  # e.g.) ti(ち)の場合
  # {
  #   1 => 'o', 4 => '-',
  #   2 => 'o', 5 => 'o',
  #   3 => 'o', 6 => '-',
  #  }
  def self.generate(romaji)
    char = romaji.char

    # 規則性がないローマ字の場合は点字情報を指定して返却
    return Constant::UNIQUE[char] if Constant::UNIQUE.keys.include?(char)

    # 初期値(全て'-')
    tenji = Constant::BLANK.dup

    # 母音の点字情報を反映
    tenji.merge!(Constant::VOWEL[romaji.vowel])

    # 子音の点字情報を反映
    tenji.merge!(Constant::CONSONANT[romaji.consonant] || {})
  end
end
