require 'romaji'

class TenjiMaker

  def to_tenji(text)

    # ローマ字から点字ブロックの情報を取得
    tenji_blocks = text.split.map do |char|
      Romaji.new(char).tenji_block
    end

    # 点字ブロックの情報から出力フォーマットを形成
    fromat_tenji(tenji_blocks)
  end

  private

  # 点字ブロックの情報から出力フォーマットを形成
  def fromat_tenji(tenji_blocks)
    first, second, third = [[], [], []]

    # ブロック情報から各行に出力する点字情報を保持
    tenji_blocks.each do |tb|
      first  << "#{tb[1]}#{tb[4]}"
      second << "#{tb[2]}#{tb[5]}"
      third  << "#{tb[3]}#{tb[6]}"
    end

    <<~"TENJI".chomp
    #{first.join(" ")}
    #{second.join(" ")}
    #{third.join(" ")}
    TENJI
  end
end
