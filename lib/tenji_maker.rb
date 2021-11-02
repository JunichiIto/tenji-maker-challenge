class TenjiMaker
  def to_tenji(text)
    tenji_blocks = text.split.map do |char|
      tenji_block(char)
    end
    format_tenji(tenji_blocks)
  end

  # 文字を引数に点字情報をHashに格納する
  # @param [String] ローマ字
  # @return [Hash]
  # ti(ち)
  # - o
  # - -
  # - o
  #     {
  #       1 => true, 2 => false,
  #       3 => true, 4 => true,
  #       5 => true, 6 => false
  #     }
  def tenji_block(char)
    if OTHER.keys.include?(char)
      OTHER[char]
    else
      # 子音
      shiin = char.length == 1 ? 'a' : char[0..-2]
      # 母音
      boin = char[-1]
      BOIN[boin].merge(SHIIN[shiin])
    end
  end

  #　tenji_blockの配列から点字フォーマットの文字列を作成
  # @param [Array] tenji_blockを要素とする配列
  def format_tenji(tenji_blocks)
    lines = {
      first: [],
      second: [],
      third: []
    }
    tenji_blocks.each do |tb|
      lines[:first] << "#{tb[1]}#{tb[4]}"
      lines[:second] << "#{tb[2]}#{tb[5]}"
      lines[:third] << "#{tb[3]}#{tb[6]}"
    end

    <<~"TENJI".chomp
      #{lines[:first].join(" ")}
      #{lines[:second].join(" ")}
      #{lines[:third].join(" ")}
    TENJI
  end


  OTHER = {
    'YA' => {
      1 => '-', 4 => 'o',
      2 => '-', 5 => '-',
      3 => 'o', 6 => '-',
    },
    'YU' => {
      1 => '-', 4 => 'o',
      2 => '-', 5 => '-',
      3 => 'o', 6 => 'o',
    },
    'YO' => {
      1 => '-', 4 => 'o',
      2 => '-', 5 => 'o',
      3 => 'o', 6 => '-',
    },
    'WA' => {
      1 => '-', 4 => '-',
      2 => '-', 5 => '-',
      3 => 'o', 6 => '-',
    },
    'WO' => {
      1 => '-', 4 => '-',
      2 => '-', 5 => 'o',
      3 => 'o', 6 => '-',
    },
    'N' => {
      1 => '-', 4 => '-',
      2 => '-', 5 => 'o',
      3 => 'o', 6 => 'o',
    }
  }

  # ① ④
  # ②
  BOIN = {
    'A' => {
      1 => 'o', 4 => '-',
      2 => '-'
    },
    'I' => {
      1 => 'o', 4 => '-',
      2 => 'o'
    },
    'U' => {
      1 => 'o', 4 => 'o',
      2 => '-'
    },
    'E' => {
      1 => 'o', 4 => 'o',
      2 => 'o'
    },
    'O' => {
      1 => '-', 4 => 'o',
      2 => 'o'
    },
  }

  #    ⑤
  # ③ ⑥
  SHIIN = {
    'a' => {
                5 => '-',
      3 => '-', 6 => '-'
    },
    'K' => {
                5 => '-',
      3 => '-', 6 => 'o'
    },
    'S' => {
                5 => 'o',
      3 => '-', 6 => 'o'
    },
    'T' => {
                5 => 'o',
      3 => 'o', 6 => '-'
    },
    'N' => {
                5 => '-',
      3 => 'o', 6 => '-'
    },
    'H' => {
                5 => '-',
      3 => 'o', 6 => 'o'
    },
    'M' => {
                5 => 'o',
      3 => 'o', 6 => 'o'
    },
    'R' => {
                5 => 'o',
      3 => '-', 6 => '-'
    },
  }
end
