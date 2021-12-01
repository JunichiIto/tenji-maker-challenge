module TenjiHandler

  def show_tenji(tenji_array)
    tenji_rows = []
    # 点字は3段なのでそれぞれの行で取得
    0.upto(2) do |num|
      # 点字1文字の配列と、それ以外で分岐
      if tenji_array[0][0].kind_of?(String)
        tenji_row = tenji_array[num].join('')
      else
        tenji_row = tenji_array.inject(''){|tenji_result_str, tenji_part| 
          # それぞれの配列を文字として取得し、区切り文字として半角スペースを入れる
          tenji_result_str += tenji_part[num].join('') + ' '
        }
      end
      tenji_rows << tenji_row
    end

    tenji_rows.map{ |tenji_row| tenji_row.strip }.join("\n")
  end

  def merge_tenji_array(*array)
    a = array[0].zip(*array[1..])
    a.map { |f| 
        f.inject { |result, row| 
                merge_tenji_row(result, row) 
        }
    }
  end

  def merge_tenji_row(row_a, row_b)
    return row_a if row_a == row_b
    tmp = []
    0.upto(row_a.length-1) do |num|
      tmp << (row_a[num] == 'o' || row_b[num] == 'o' ? 'o' : '-')
    end
    tmp
  end
end