require_relative '../lib/tenji_constant'

# ローマ字1文字を点字配列に変換するクラス
class TenjiArrayGenerator
  include TenjiConstant

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

  # 指定した位置に点を打った点字配列を作成する
  #
  # @example 3,5,6の位置に点を打った点字配列を取得する
  #   generate_tenji_array([3,5,6])
  #   #=> [['-', '-'], ['o', '-'], ['o', 'o']]
  #
  # @param [Array] tenji_points 点を打つ位置を定義した配列
  # @return [Array] 2要素*3行の点字配列
  def generate_tenji_array(tenji_points)
    template = Array.new(TENJI_COLUMN_NUM * TENJI_ROW_NUM, '-')
    flat_tenji_array = template.map.with_index{ |elem, idx| tenji_points.include?(idx + 1) ? 'o' : elem }
    (0...TENJI_ROW_NUM).map { |idx| [flat_tenji_array[idx], flat_tenji_array[idx + TENJI_ROW_NUM]] }
  end

  # 2つの点字配列をマージした新たな点字配列を取得する
  #
  # @example [['-', '-'], ['-', '-'], ['-', 'o']], [['o', '-'], ['-', '-'], ['-', '-']]をマージした点字配列を取得
  #   merge_tenji_array([['-', '-'], ['-', '-'], ['-', 'o']], [['o', '-'], ['-', '-'], ['-', '-']])
  #   #=> [['o', '-'], ['-', '-'], ['-', 'o']]
  #
  # @param [Array] tenji_array_a 2要素*3行の点字配列の1つ目
  # @param [Array] tenji_array_b 2要素*3行の点字配列の2つ目
  # @return [Array] 引数をマージした結果の2要素*3行の点字配列
  def merge_tenji_array(tenji_array_a, tenji_array_b)
    tenji_array_a.zip(tenji_array_b).map { |rows| 
      # 同じ位置にある行の点字配列をマージする
      rows.inject { |result, row| merge_tenji_row(result, row) }
    }
  end

  # 2つの点字行配列を比較し、2つの行内で'o'が含まれている点を反映させた新たな点字行配列を取得する
  #
  # @example ['-', 'o'], ['o', '-']から新たな点字行配列を取得
  #   merge_tenji_row(['-', 'o'], ['o', '-']) #=> ['o', 'o']
  #
  # @param [Array] row_array_a 2要素の点字行配列の1つ目
  # @param [Array] row_array_b 2要素の点字行配列の2つ目
  # @return [Array] 引数をマージした結果の2要素の点字行配列
  def merge_tenji_row(row_array_a, row_array_b)
    (0...TENJI_COLUMN_NUM).map { |elem_idx|
      # 同じ位置の要素に'o'がある場合は、その要素に'o'を反映させた配列を作成する
      # 1.点字->BIT, 2.BITのOR演算 3.BIT->点字 の流れで変換する
      TENJI_BIT.invert[TENJI_BIT[row_array_a[elem_idx]] | TENJI_BIT[row_array_b[elem_idx]]]
    }
  end

end
