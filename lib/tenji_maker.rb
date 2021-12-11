require_relative '../lib/tenji'
require_relative '../lib/renderer'

#
# 点字メーカー
#
class TenjiMaker
  #
  # 点字に変換/出力する
  #
  # @param [String] text
  #
  # @return [String]
  #
  def to_tenji(text)
    charactors = text.split(' ')
    tenjies = to_tenji_strings(charactors)
    Renderer.render(tenjies)
  end

  private

  #
  # 点字文字列への変換
  #
  # @param [Array] charactors
  #
  # @return [Array]
  #
  def to_tenji_strings(charactors)
    charactors.map do |charactor|
      tenji = Tenji.new(charactor)
      tenji.convert
    end
  end
end
