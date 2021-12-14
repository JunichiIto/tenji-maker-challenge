require_relative '../lib/tenji_handler'

# ローマ字1文字を点字配列に変換するクラス
class TenjiCharGenerator
  include TenjiHandler

  # 母音の点字の位置
  VOWEL_TENJI_POINT = {
    'A' => [1],
    'I' => [1, 2],
    'U' => [1, 4],
    'E' => [1, 2, 4],
    'O' => [2, 4]
  }.freeze

  # 子音の点字の位置
  CONSONANT_TENJI_POINT = {
    'K' => [6],
    'S' => [5, 6],
    'T' => [3, 5],
    'N' => [3],
    'H' => [3, 6],
    'M' => [3, 5, 6],
    'R' => [5]
  }.freeze

  # 例外として処理する点字の位置
  EXCEPTION_TENJI_POINT = {
    'YA' => [3, 4],
    'YU' => [3, 4, 6],
    'YO' => [3, 4, 5],
    'WA' => [3],
    'N' => [3, 5, 6]
  }.freeze

  # 点字に変換したいローマ字1文字から点字配列を取得する
  #
  # @example 'KA'を点字配列に変換する
  #   to_tenji_char_array('KA') #=> [['o', '-'], ['-', '-'], ['-', 'o']]
  #
  # @param [String] romaji_char 点字配列に変換するローマ字1文字('A','KA','WA' 等)
  # @return [Array] 2要素*3行の点字配列
  def to_tenji_char_array(romaji_char)
    return generate_tenji_array(EXCEPTION_TENJI_POINT[romaji_char]) if EXCEPTION_TENJI_POINT.has_key?(romaji_char)
    return generate_tenji_array(VOWEL_TENJI_POINT[romaji_char]) if VOWEL_TENJI_POINT.has_key?(romaji_char)
    merge_tenji_array(generate_tenji_array(CONSONANT_TENJI_POINT[romaji_char[0]]), generate_tenji_array(VOWEL_TENJI_POINT[romaji_char[1]]))
  end

  # 点字の点から点字配列を作成する
  def generate_tenji_array(tenji_points)
    template = Array.new(TENJI_COLUMN_NUM * TENJI_ROW_NUM, '-')
    flat_tenji_array = template.map.with_index{ |elem, idx| tenji_points.include?(idx + 1) ? 'o' : elem }
    (0..TENJI_ROW_NUM).map { |idx| [flat_tenji_array[idx], flat_tenji_array[idx + TENJI_ROW_NUM]] }
  end

end
