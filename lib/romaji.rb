#
# ローマ字
#
class Romaji
  attr_reader :vowel, :consonant

  #
  # 初期化
  #
  # @param [String or nil] vowel 母音
  # @param [String or nil] consonant 子音
  #
  def initialize(vowel, consonant)
    @vowel = vowel ? vowel.to_sym : nil
    @consonant = consonant ? consonant.to_sym : nil
  end

  #
  # 子音が w かどうか
  #
  # @return [boolean]
  #
  def consonant_w?
    @consonant == :W
  end

  #
  # 子音が y かどうか
  #
  # @return [boolean]
  #
  def consonant_y?
    @consonant == :Y
  end

  #
  # n のみかどうか
  #
  # @return [boolean]
  #
  def consonant_only_n?
    @vowel.nil? && @consonant == :N
  end
end
