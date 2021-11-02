module TenjiBlock

  BLANK_TENJI = {
    1 => '-', 4 => '-',
    2 => '-', 5 => '-',
    3 => '-', 6 => '-',
  }

  # 規則性のない一意の点字「や、ゆ、よ、わ、を、ん」
  UNIQUE_TENJI = {
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
    'N' => {
      1 => '-', 4 => '-',
      2 => '-', 5 => 'o',
      3 => 'o', 6 => 'o',
    }
  }.freeze

  # 母音
  # ① ④
  # ②
  VOWEL_TENJI = {
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
  }.freeze

  # 子音
  #    ⑤
  # ③ ⑥
  CONSONANT_TENJI = {
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
  }.freeze

  # ローマ字を引数に点字情報をHashに格納する
  # @param [String] ローマ字('HA', 'N', etc..)
  # @return [Hash]
  # e.g.) ti(ち)の場合
  # {
  #   1 => 'o', 4 => '-',
  #   2 => 'o', 5 => 'o',
  #   3 => 'o', 6 => '-',
  #  }
  def self.generate(char)

    if UNIQUE_TENJI.keys.include?(char)
      # 規則性がない文字の場合
      UNIQUE_TENJI[char]
    else
      # 規則性がある文字の場合

      # 初期値(全て'-')
      tenji = BLANK_TENJI.dup

      # 母音
      # 末尾の文字が母音
      vowel_text = char[-1]
      # 母音の点字情報を反映
      tenji.merge!(VOWEL_TENJI[vowel_text])

      # 子音
      if char.length > 1
        # 2文字以上の場合は末尾の文字だけ除けば子音となる
        consonant_text = char[0..-2]
        # 子音の点字情報を反映
        tenji.merge!(CONSONANT_TENJI[consonant_text])
      end

      tenji
    end
  end
end
