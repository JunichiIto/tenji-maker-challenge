#
# 文字
#
class Charactor
  #
  # 初期化
  #
  # @param [String] charactor
  #
  def initialize(charactor)
    @content = charactor
    @size = charactor.size
    @is_n = @size == 1 && charactor == 'N'
    @is_vowel = @size == 1 && !@is_n
  end

  #
  # 文字を分割
  #
  # @return [Array]
  #
  def separate
    return [@content[1], @content[0]] if @size == 2
    return [nil, @content[0]] if @is_n
    return [@content[0], nil] if @is_vowel

    raise '入力文字が正しくありません。'
  end
end
