require_relative '../lib/romaji'
require_relative '../lib/charactor'

#
# 点字
#
class Tenji
  TABLE = {
    A: %w[o - -],
    I: %w[o - o],
    U: %w[o o -],
    E: %w[o o o],
    O: %w[- o o],
    K: %w[- - o],
    S: %w[o - o],
    T: %w[o o -],
    N: %w[- o -],
    H: %w[- o o],
    M: %w[o o o],
    R: %w[o - -]
  }.freeze

  #
  # 初期化
  #
  # @param [String] charactor
  #
  def initialize(charactor)
    @romaji = to_romaji(charactor)
  end

  #
  # 点字文字列への変換
  #
  # @return [String]
  #
  def convert
    return convert_irregularly if irrejular?

    convert_regularly
  end

  private

  #
  # 規則的な点字の変換
  #
  # @return [String]
  #
  def convert_regularly
    vowel_symboles = TABLE[@romaji.vowel]
    consonant_symboles = TABLE[@romaji.consonant] || %w[- - -]
    (vowel_symboles + consonant_symboles).join
  end

  #
  # 不規則な点字の変換(子音が w y と n だけの場合)
  #
  # @return [String]
  #
  def convert_irregularly
    return '---ooo' if @romaji.consonant_only_n?
    return '----o-' if @romaji.consonant_w?

    (%w[- o -] + TABLE[@romaji.vowel].rotate).join if @romaji.consonant_y?
  end

  #
  # 不規則かどうか
  #
  # @return [boolean]
  #
  def irrejular?
    @romaji.consonant_w? ||
      @romaji.consonant_only_n? ||
      @romaji.consonant_y?
  end

  #
  # ローマ字インスタンスへ変換
  #
  # @param [String] charactor
  #
  # @return [Romaji]
  #
  def to_romaji(charactor)
    char = Charactor.new(charactor)
    vowel, consonant = char.separate
    Romaji.new(vowel, consonant)
  end
end
