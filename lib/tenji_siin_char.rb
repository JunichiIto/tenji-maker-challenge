require_relative '../lib/tenji_handler'

# MARK: オブジェクト指向のアンチパターンとなっている箇所の改修
# 2文字で成立するローマ字の子音部分を点字配列に変換するクラス
class TenjiSiinChar
  include TenjiHandler

  # 2文字で成立するローマ字の子音部分から点字配列を取得する
  #
  # @example 'K'を点字配列に変換する
  #   to_tenji_siin_array('K') #=> [['-', '-'], ['-', '-'], ['-', 'o']]
  #
  # @param [String] char 点字配列に変換する1文字
  # @return [Array] 2要素*3行の点字配列
  def to_tenji_siin_array(char)
    template = Array.new(TENJI_ROW_NUM) { Array.new(TENJI_COLUMN_NUM, '-') }
    case char
    when 'K'
      template[2][1] = 'o'
    when 'S'
      template[1][1] = 'o'
      template[2][1] = 'o'
    when 'T'
      template[1][1] = 'o'
      template[2][0] = 'o'
    when 'N'
      template[2][0] = 'o'
    when 'H'
      template[2][1] = 'o'
      template[2][0] = 'o'
    when 'M'
      template[1][1] = 'o'
      template[2][1] = 'o'
      template[2][0] = 'o'
    when 'R'
      template[1][1] = 'o'
    when 'Y'
      template[0][1] = 'o'
    end
    # 'W'は全て'-'なのでtemplateをそのまま利用する
    template
  end
end
