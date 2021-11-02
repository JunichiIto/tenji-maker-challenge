require 'tenji_block'

class TenjiMaker
  # 点字関連の定数
  include TenjiBlock

  def to_tenji(text)
    # 各行に出力するブロック情報を記録するHash
    lines = {
      first: [],
      second: [],
      third: []
    }

    text.split.map do |char|
      # ローマ字から点字ブロックの情報を取得
      tb = TenjiBlock.generate(char)

      # ブロック情報から各行に出力するテキストを保持
      lines[:first]  << "#{tb[1]}#{tb[4]}"
      lines[:second] << "#{tb[2]}#{tb[5]}"
      lines[:third]  << "#{tb[3]}#{tb[6]}"
    end

    # 各行のテキストを空白区切りで結合
    each_line_texts = lines.values.map{|text| text.join(" ") }

    # 各行のテキストを改行コードで区切る
    each_line_texts.join("\n")
  end
end
