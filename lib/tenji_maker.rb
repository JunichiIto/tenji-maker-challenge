class TenjiMaker
  # 点字の配置を数値で表現したデータのテーブル。
  # 文字に対応する点字の配置を 2進数で表記する。
  # 点字のマスの (1) が bit0 、(6) が bit4 という形で対応する
  @@tenji_table_one = {
    # 母音
    'A' => '000001'.to_i(2), # (1)
    'I' => '000011'.to_i(2), # (2)(1)
    'U' => '001001'.to_i(2), # (4)(1)
    'E' => '001011'.to_i(2), # (4)(2)(1)
    'O' => '001010'.to_i(2), # (4)(2)
    # 撥音
    'N' => '110100'.to_i(2)  # (6)(5)(3)
  }
  @@tenji_table_two = {
    # 子音
    'K' => '100000'.to_i(2), # (6)
    'S' => '110000'.to_i(2), # (6)(5)
    'T' => '010100'.to_i(2), # (5)(3)
    'N' => '000100'.to_i(2), # (3)
    'H' => '100100'.to_i(2), # (6)(3)
    'M' => '110100'.to_i(2), # (6)(5)(3)
    'R' => '010000'.to_i(2), # (5)
    'Y' => '001000'.to_i(2), # (4)
    'W' => '000000'.to_i(2)  #
  }

  TENJI_DOT = 'o'
  TENJI_BLANK = '-'
  TENJI_SPACE = ' '
  
  # 文字列を点字に変換
  def to_tenji(text)
    # 文字列を空白で分割してリストにする
    tenji_list = text.split(' ')

    # リストの中身をテーブルで置換する
    tenji_list = tenji_list.map{
      |tenji|       
      # 1文字の場合
      if tenji.length == 1
        @@tenji_table_one[tenji]
      # 2文字の場合
      else
        # や行とわ行は母音を一番下に移動して子音と OR する
        if tenji[0] == 'Y' or tenji[0] == 'W'
          if tenji[1] == 'I' or tenji[1] == 'E' or tenji[1] == 'O'
            @@tenji_table_two[tenji[0]] | (@@tenji_table_one[tenji[1]] << 1) # 母音を一番下に移動
          else
            @@tenji_table_two[tenji[0]] | (@@tenji_table_one[tenji[1]] << 2) # 母音を一番下に移動
          end
        # それ以外は母音と子音を OR する
        else
          @@tenji_table_two[tenji[0]] | @@tenji_table_one[tenji[1]]
        end
      end
    }

    # 点字データを点字文字列に変換する
    tenji_row = ['','','']
    tenji_col = ['000001'.to_i(2),'001000'.to_i(2)] # この値と AND して、点字データからドットを抽出する
    # 点字 3行分を処理する
    for i in 0..2 do
      tenji_list.each do |tenji|
        tenji_row[i] += (tenji & tenji_col[0]) != 0 ? TENJI_DOT : TENJI_BLANK # 1列目
        tenji_row[i] += (tenji & tenji_col[1]) != 0 ? TENJI_DOT : TENJI_BLANK # 2列目
        tenji_row[i] += TENJI_SPACE
      end
      # マスクをシフトして次のドットを抽出する
      tenji_col = tenji_col.map{|col| col << 1}
    end

    # 点字データを一連の文字列にして返却
    return tenji_row[0]+"\r\n"+tenji_row[1]+"\r\n"+tenji_row[2]
  end
end

if __FILE__ == $0
  t = TenjiMaker.new()
  puts t.to_tenji('A I U E O')
  puts t.to_tenji('KA KI KU KE KO')
  puts t.to_tenji('SA SI SU SE SO')
  puts t.to_tenji('TA TI TU TE TO')
  puts t.to_tenji('NA NI NU NE NO')
  puts t.to_tenji('HA HI HU HE HO')
  puts t.to_tenji('MA MI MU ME MO')
  puts t.to_tenji('RA RI RU RE RO')
  puts t.to_tenji('YA YU YO')
  puts t.to_tenji('WA')
  puts t.to_tenji('N')
end
