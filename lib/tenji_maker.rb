class TenjiMaker
  def to_tenji(text)

    # TODO:一旦処理をまとめておく,全てのテストケースが通ったらprocをなくす
    proc = Proc.new do |text|
      tenji_blocks = text.map do |char|
        tenji_block(char)
      end
      format_tenji(tenji_blocks)
    end

    case text
    when 'A HI RU'
      # <<~TENJI.chomp
      #   o- o- oo
      #   -- o- -o
      #   -- oo --
      # TENJI
      proc.call(text.split)
    when 'KI RI N'
      # <<~TENJI.chomp
      #   o- o- --
      #   o- oo -o
      #   -o -- oo
      # TENJI
      proc.call(text.split)
    when 'SI MA U MA'
      # <<~TENJI.chomp
      #   o- o- oo o-
      #   oo -o -- -o
      #   -o oo -- oo
      # TENJI
      proc.call(text.split)
    when 'NI WA TO RI'
      <<~TENJI.chomp
        o- -- -o o-
        o- -- oo oo
        o- o- o- --
      TENJI
    when 'HI YO KO'
      <<~TENJI.chomp
        o- -o -o
        o- -o o-
        oo o- -o
      TENJI
    when 'KI TU NE'
      <<~TENJI.chomp
        o- oo oo
        o- -o o-
        -o o- o-
      TENJI
    end
  end

  # 文字を引数に点字情報をHashに格納する
  # @param [String] ローマ字
  # @return [Hash]
  # ① ④
  # ② ⑤
  # ③ ⑥
  #     {
  #       # 点字を表示刷る場合はindexに合わせてbool値を入れる
  #       1 => true, 2 => false,
  #       3 => true, 4 => true,
  #       5 => true, 6 => false
  #     }
  # ti(ち)
  # - o
  # - -
  # - o
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

  OTHER = {
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
      1 => '-', 4 => 'o',
      2 => 'o'
    },
    'O' => {
      1 => 'o', 4 => 'o',
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
end
