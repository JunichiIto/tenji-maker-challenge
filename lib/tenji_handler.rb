module TenjiHandler
  def show_tenji(tenji_array)
    tenji_array.map{|tenji_row| tenji_row.join{""}}.join("\n")
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