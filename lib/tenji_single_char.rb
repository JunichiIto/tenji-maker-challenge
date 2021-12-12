require_relative '../lib/tenji_handler'

# MARK: オブジェクト指向のアンチパターンとなっている箇所の改修
# 1文字で成立するローマ字を点字配列に変換するクラス
class TenjiSingleChar
  include TenjiHandler

  # 1文字で成立するローマ字から点字配列を取得する
  #
  # @example 'A'を点字配列に変換する
  #   to_tenji_single_array('A') #=> [['o', '-'], ['-', '-'], ['-', '-']]
  #
  # @param [String] char 点字配列に変換する1文字
  # @return [Array] 2要素*3行の点字配列
  def to_tenji_single_array(char)
    template = Array.new(TENJI_ROW_NUM) { Array.new(TENJI_COLUMN_NUM, '-') }
    case char
    when 'A'
      template[0][0] = 'o'
    when 'I'
      template[0][0] = 'o'
      template[1][0] = 'o'
    when 'U'
      template[0][0] = 'o'
      template[0][1] = 'o'
    when 'E'
      template[0][0] = 'o'
      template[1][0] = 'o'
      template[0][1] = 'o'
    when 'O'
      template[0][1] = 'o'
      template[1][0] = 'o'
    when 'N'
      template[1][1] = 'o'
      template[2][0] = 'o'
      template[2][1] = 'o'
    end
    template
  end
end
