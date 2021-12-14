require_relative '../lib/tenji_handler'

# MARK: オブジェクト指向のアンチパターンとなっている箇所の改修
# ローマ字1文字を点字配列に変換するクラス
class TenjiCharGenerator
  include TenjiHandler

  # 点字に変換したいローマ字1文字から点字配列を取得する
  #
  # @example 'KA'を点字配列に変換する
  #   to_tenji_char_array('KA') #=> [['o', '-'], ['-', '-'], ['-', 'o']]
  #
  # @param [String] romaji_char 点字配列に変換するローマ字1文字('A','KA','WA' 等)
  # @return [Array] 2要素*3行の点字配列
  def to_tenji_char_array(romaji_char)
    tenji_single_array = to_tenji_single_array(romaji_char[-1])
    return tenji_single_array if romaji_char.length == 1

    tenji_siin_array = to_tenji_siin_array(romaji_char[0])
    case romaji_char
    when "YA", "YU", "WA" then
      merge_tenji_array(tenji_siin_array, tenji_single_array.reverse)
    when "YO" then
      merge_tenji_array(tenji_siin_array, tenji_single_array.rotate(-1))
    else
      merge_tenji_array(tenji_siin_array, tenji_single_array)
    end
  end

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
