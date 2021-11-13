class TenjiMaker
  def initialize()
    # 点字の配置を数値で表現したデータのテーブルを初期化する
    # 文字に対応する点字の配置を 2進数で表記する。
    # 点字のマスの (1) が bit0 、(6) が bit5 という形で対応する
    @tenji_table_one = {
      # 母音
      'A' => 0b000_001, # (1)
      'I' => 0b000_011, # (2)(1)
      'U' => 0b001_001, # (4)(1)
      'E' => 0b001_011, # (4)(2)(1)
      'O' => 0b001_010, # (4)(2)
      # 撥音
      'N' => 0b110_100  # (6)(5)(3)
    }
    @tenji_table_two = {
      # 子音
      'K' => 0b100_000, # (6)
      'S' => 0b110_000, # (6)(5)
      'T' => 0b010_100, # (5)(3)
      'N' => 0b000_100, # (3)
      'H' => 0b100_100, # (6)(3)
      'M' => 0b110_100, # (6)(5)(3)
      'R' => 0b010_000, # (5)
      'Y' => 0b001_000, # (4)
      'W' => 0b000_000  #
    }
    @text_sep    = ' ' # テキストの区切り文字
    @tenji_dot   = 'o' # ドットを表す文字
    @tenji_blank = '-' # ブランクを表す文字
    @tenji_sep   = ' ' # 点字の区切り文字
  end
  
  # 文字列を点字に変換
  def to_tenji(text)
    # 文字列を空白で分割してリストにする
    text_list = text.split(@text_sep)

    # リストの中身をテーブルで置換する
    tenji_list = Array.new()
    text_list.each do |tenji|
      # 1文字の場合
      if tenji.length == 1
        tenji_list.push(@tenji_table_one[tenji])
      # 2文字の場合
      else
        # や行とわ行は母音を一番下に移動して子音と OR する
        if tenji[0] == 'Y' or tenji[0] == 'W'
          # 母音を一番したに移動する。「い」「え」「お」は母音の点字を1つ下げ、それ以外は2つ下げる
          if tenji[1] == 'I' or tenji[1] == 'E' or tenji[1] == 'O'
            tenji_list.push(@tenji_table_two[tenji[0]] | (@tenji_table_one[tenji[1]] << 1))
          else
            tenji_list.push(@tenji_table_two[tenji[0]] | (@tenji_table_one[tenji[1]] << 2))
          end
        # それ以外は母音と子音を OR する
        else
          tenji_list.push(@tenji_table_two[tenji[0]] | @tenji_table_one[tenji[1]])
        end
      end
    end

    # 点字リストを点字に変換して返却
    return tenji_list_to_string(tenji_list) 
  end

  # 点字リストを点字文字列に変換する
  def tenji_list_to_string(tenji_list)
    tenji_col = [0b000001,0b001000] # この値と AND して、点字データからドットを抽出する
    tenji = "" # 返却する文字列を格納する

    # 点字 3行分を処理する
    for i in 0..2 do
      tenji_row = "" # 点字の1行分の文字列を格納する
      tenji_list.each do |tenji|
        tenji_row += (tenji & tenji_col[0]) != 0 ? @tenji_dot : @tenji_blank # 1列目
        tenji_row += (tenji & tenji_col[1]) != 0 ? @tenji_dot : @tenji_blank # 2列目
        tenji_row += @tenji_sep
      end

      # マスクをシフトして次のドットを抽出する
      tenji_col = tenji_col.map{|col| col << 1}

      # 1行分の点字文字列を改行コードをつけて結合する
      tenji += tenji_row+"\r\n"
    end

    # 点字データを一連の文字列にして返却
    return tenji.chomp()
  end
end

if __FILE__ == $0
  t = TenjiMaker.new()
  puts t.to_tenji('A KA SA TA NA')
end
