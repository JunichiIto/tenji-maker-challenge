class TenjiMaker
  # 点字のコード表現を扱うモジュール
  #
  # 点字データを表現するために、6ビットのバイナリ値を用いる。
  # バイナリ形式（上位から数えてNビット目の対応）を以下のように定義する
  #
  # 例： A
  # o- 14
  # -- 25
  # -- 36
  #
  # -> 0b100000
  #
  # 例： ME
  # oo 14
  # oo 25
  # oo 36
  #
  # -> 0b111111
  #
  # あかさたなはまら行までは母音を表す1, 2, 4 bit目、子音を表す3, 5, 6 bit目の組み合わせbit OR演算で表現できる。
  # 例：SUは
  # 母音Uを表す `0b100100`
  # さ行を表す  `0b000011`
  # をOR演算で論理和を取り、
  # oo 14
  # -o 25
  # -o 36
  #
  # -> 0b100111
  # となる
  #
  # や行、わ行「ん」については特殊なので例外扱いとする。
  # ※仕様上「を」は扱わないで良い
  module Code
    # 母音ビット
    BIT_A      = 0b100000
    BIT_I      = 0b110000
    BIT_U      = 0b100100
    BIT_E      = 0b110100
    BIT_O      = 0b010100
    VOWEL_BITS = {
      A: BIT_A,
      I: BIT_I,
      U: BIT_U,
      E: BIT_E,
      O: BIT_O
    }.freeze

    # 子音ビット
    BIT_KA_COLUMN  = 0b000001
    BIT_SA_COLUMN  = 0b000011
    BIT_TA_COLUMN  = 0b001010
    BIT_NA_COLUMN  = 0b001000
    BIT_HA_COLUMN  = 0b001001
    BIT_MA_COLUMN  = 0b001011
    BIT_RA_COLUMN  = 0b000010
    CONSONANT_BITS = {
      K: BIT_KA_COLUMN,
      S: BIT_SA_COLUMN,
      T: BIT_TA_COLUMN,
      N: BIT_NA_COLUMN,
      H: BIT_HA_COLUMN,
      M: BIT_MA_COLUMN,
      R: BIT_RA_COLUMN
    }.freeze

    # 例外ケース
    BIT_YA = 0b001100
    BIT_YU = 0b001101
    BIT_YO = 0b001110
    BIT_WA = 0b001000
    # BIT_WO = 0b001010 # ※仕様外のため無効化
    BIT_N        = 0b001011
    STICKY_ROMES = {
      YA: BIT_YA,
      YU: BIT_YU,
      YO: BIT_YO,
      WA: BIT_WA,
      N:  BIT_N
    }.freeze

    # Rome to Tenji対応ハッシュテーブル
    R2T_TABLE = {}

    def self.included(_)
      # あ行は子音なし
      VOWEL_BITS.each do |v_char, v_bit|
        R2T_TABLE[:"#{v_char}"] = v_bit
      end

      # 母音bit | 子音bitで表現できる文字
      CONSONANT_BITS.each do |c_char, c_bit|
        VOWEL_BITS.each do |v_char, v_bit|
          R2T_TABLE[:"#{c_char}#{v_char}"] = c_bit | v_bit
        end
      end

      # 例外系
      STICKY_ROMES.each do |s_char, s_bit|
        R2T_TABLE[:"#{s_char}"] = s_bit
      end

      # 変更されることは考えないのでfreezeしておく
      R2T_TABLE.freeze
    end
  end
end
