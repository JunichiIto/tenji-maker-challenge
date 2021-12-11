require_relative '../lib/tenji_handler'

# MARK: オブジェクト指向のアンチパターンとなっている箇所の改修
# MARK: クラス名を子音のクラスとする
# 2文字で成立するローマ字の子音部分を点字配列に変換するクラス
class TenjiDoubleChar
  include TenjiHandler

  # 2文字で成立するローマ字の子音部分から点字配列を取得する
  #
  # @example 'K'を点字配列に変換する
  #   to_tenji_double_array('K') #=> [['-', '-'], ['-', '-'], ['-', 'o']]
  #
  # @param [String] char 点字配列に変換する1文字
  # @return [Array] 2要素*3行の点字配列
  def to_tenji_double_array(char)
    template = Array.new(TENJI_ROW_NUM) { Array.new(TENJI_COLUMN_NUM, '-') }
    # MARK: 無駄にマージを利用している箇所を素直に定義する
    case char
    when 'K' then
      template[2][1] = 'o'
      template
    when 'S' then
      merge_tenji_array(to_tenji_double_array('K'), to_tenji_double_array('R'))
    when 'T' then
      merge_tenji_array(to_tenji_double_array('N'), to_tenji_double_array('R'))
    when 'N' then
      template[2][0] = 'o'
      template
    when 'H' then
      merge_tenji_array(to_tenji_double_array('K'), to_tenji_double_array('N'))
    when 'M' then
      merge_tenji_array(to_tenji_double_array('H'), to_tenji_double_array('R'))
    when 'R' then
      template[1][1] = 'o'
      template
    when 'Y' then
      template[0][1] = 'o'
      template
    when 'W'
      template
    end
  end
end
