# 配列を点字に変換するモジュール
module TenjiHandler
  # 点字の列数
  TENJI_COLUMN_NUM = 2
  # 点字の列数
  TENJI_ROW_NUM = 3

  # 点字配列を文字列として整形して表示する
  #
  # @example [[['o', '-'], ['-', '-'], ['-', 'o']], [['o', '-'], ['-', 'o'], ['-', '-']], [['o', 'o'], ['-', 'o'], ['-', 'o']]]を点字として表示
  #   show_tenji([['-', '-'], ['-', '-'], ['-', 'o']], [['o', '-'], ['-', '-'], ['-', '-']])
  #   #=> o- o- oo
  #       -- -o -o
  #       -o -- -o
  #
  # param [Array] 文字列を点字配列に変換したデータを保持する配列
  # return [String] 点字の文字列
  def show_tenji(tenji_array)
    # 1文字だけの点字かどうか判断
    is_single_tenji = tenji_array[0][0].kind_of?(String)
    # 点字は3行で構成されているので、各行でループする
    tenji_rows = (0...TENJI_ROW_NUM).map { |row_idx|
      # 点字1文字の場合は配列をそのまま結合した文字列を取得
      next tenji_array[row_idx].join('') if is_single_tenji
      tenji_array.inject(''){ |tenji_row_str, tenji_row| 
        # それぞれの配列を文字として取得し、区切り文字として半角スペースを入れる
        tenji_row_str += tenji_row[row_idx].join('') + ' '
      }
    }
    # 点字が2文字以上ある場合、文字列の最後に半角スペースが入るため削除処理後に改行を含めて表示する
    tenji_rows.map{ |tenji_row| tenji_row.strip }.join("\n")
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
    return row_array_a if row_array_a == row_array_b
    (0...TENJI_COLUMN_NUM).map { |elem_idx|
      # MARK: bit演算を利用する
      # 同じ位置の要素に'o'がある場合は、その要素に'o'を反映させた配列を作成する
      row_array_a[elem_idx] == 'o' || row_array_b[elem_idx] == 'o' ? 'o' : '-'
    }
  end
end