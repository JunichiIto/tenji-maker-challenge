class TenjiMaker
  # 点字の配置を数値で表現したデータのテーブル。
  # 文字に対応する点字の配置を 2 進数で表記する。
  # 点字のマスの (1) が bit0 、(5) が bit4 という形で対応する
  @@tenji_table = {
    'A' => '000001'.to_i(2), # (1)
    'I' => '000011'.to_i(2), # (1),(2)
    'U' => '001001'.to_i(2), # (1),(4)
    'E' => '001011'.to_i(2), # (1),(2),(4)
    'O' => '001010'.to_i(2)  # (2),(4)
  }
  
  # 文字列を点字に変換
  def to_tenji(text)
    # 文字列を空白で分割してリストにする
    tenji_list = text.split(' ')

    # リストの中身をテーブルで置換する
    tenji_list = tenji_list.map{|tenji| @@tenji_table[tenji]}

    # 点字データを点字文字列に変換する
    first,second,third = '','',''
    tenji_list.each do |tenji|
      first  += (tenji & '000001'.to_i(2)) != 0 ? 'o' : '-'
      first  += (tenji & '001000'.to_i(2)) != 0 ? 'o' : '-'
      first  += ' '
      second += (tenji & '000010'.to_i(2)) != 0 ? 'o' : '-'
      second += (tenji & '010000'.to_i(2)) != 0 ? 'o' : '-'
      second += ' '
      third  += (tenji & '000100'.to_i(2)) != 0 ? 'o' : '-'
      third  += (tenji & '100000'.to_i(2)) != 0 ? 'o' : '-'
      third  += ' '
    end
    return first+"\r\n"+second+"\r\n"+third
  end
end

if __FILE__ == $0
  t = TenjiMaker.new()
  puts t.to_tenji('A I U E O')
end
