require_relative '../lib/tenji_constant'

# 配列を点字に変換するモジュール
module TenjiHandler
  include TenjiConstant

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

end