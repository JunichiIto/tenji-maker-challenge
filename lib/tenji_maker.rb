require 'tenji_block'

class TenjiMaker
  # 点字関連の定数
  include TenjiBlock

  def to_tenji(text)
    lines = {
      first: [],
      second: [],
      third: []
    }

    text.split.map do |char|
      tb = tenji_block(char)
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

  # 文字を引数に点字情報をHashに格納する
  # @param [String] ローマ字('HA', 'N', etc..)
  # @return [Hash]
  # e.g.) ti(ち)
  # {
  #   1 => 'o', 4 => '-',
  #   2 => 'o', 5 => 'o',
  #   3 => 'o', 6 => '-',
  #  }
  def tenji_block(char)

    if TenjiBlock::UNIQUE_TENJI.keys.include?(char)
      # 規則性がない文字の場合
      TenjiBlock::UNIQUE_TENJI[char]
    else
      # 規則性がある文字の場合

      # 初期値(全て'-')
      tenji = TenjiBlock::BLANK_TENJI.dup

      # 母音
      # 末尾の文字が母音
      vowel_text = char[-1]
      # 母音の点字情報をマージ
      tenji.merge!(TenjiBlock::VOWEL_TENJI[vowel_text])

      # 子音
      if char.length > 1
        # 2文字以上の場合は末尾の文字だけ除けば子音となる
        consonant_text = char[0..-2]
        # 子音の点字情報をマージ
        tenji.merge!(TenjiBlock::CONSONANT_TENJI[consonant_text])
      end

      tenji
    end
  end

end
