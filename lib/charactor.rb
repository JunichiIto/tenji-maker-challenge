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
  end

  #
  # 文字を分割
  #
  # @return [Array]
  #
  def separate
    return [@content[1], @content[0]] if charactor_size == 2
    return [nil, @content[0]] if n?
    return [@content[0], nil] if vowel?

    raise '入力文字が正しくありません。'
  end

  private

  def charactor_size
    @content.size
  end

  def n?
    charactor_size == 1 && @content == 'N'
  end

  def vowel?
    charactor_size == 1 && !n?
  end
end
