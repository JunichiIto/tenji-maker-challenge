require_relative '../lib/tenji_handler'
require_relative '../lib/tenji_single_char'
require_relative '../lib/tenji_double_char'

# MARK: オブジェクト指向のアンチパターンとなっている箇所の改修
# ローマ字1文字を点字配列に変換するクラス
class TenjiCharGenerator
  include TenjiHandler

  # コンストラクタ
  def initialize
    @tenji_single = TenjiSingleChar.new
    @tenji_double = TenjiDoubleChar.new
  end

  # 点字に変換したいローマ字1文字から点字配列を取得する
  #
  # @example 'KA'を点字配列に変換する
  #   to_tenji_char_array('KA') #=> [['o', '-'], ['-', '-'], ['-', 'o']]
  #
  # @param [String] romaji_char 点字配列に変換するローマ字1文字('A','KA','WA' 等)
  # @return [Array] 2要素*3行の点字配列
  def to_tenji_char_array(romaji_char)
    tenji_single_array = @tenji_single.to_tenji_single_array(romaji_char[-1])
    return tenji_single_array if romaji_char.length == 1

    tenji_double_array = @tenji_double.to_tenji_double_array(romaji_char[0])
    case romaji_char
    when "YA", "YU", "WA" then
      merge_tenji_array(tenji_double_array, tenji_single_array.reverse)
    when "YO" then
      merge_tenji_array(tenji_double_array, tenji_single_array.rotate(-1))
    else
      merge_tenji_array(tenji_double_array, tenji_single_array)
    end
  end
end
