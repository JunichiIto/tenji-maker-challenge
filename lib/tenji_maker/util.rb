class TenjiMaker
  # 点字の文字列変換などの操作を扱うモジュール
  module Util
    private

    # 1文字分の点字バイナリをhuman readable文字列形式（改行区切りのo-表現）に変換する
    # 例： 0b100000
    # ->
    # o-
    # --
    # --
    def stringify_tenji(binary)
      chars = format('%06B', binary).chars
      "#{chars[0]}#{chars[3]}\n#{chars[1]}#{chars[4]}\n#{chars[2]}#{chars[5]}".gsub!('0', '-').gsub!('1', 'o')
    end

    # 引数として渡された点字バイナリ表現配列から点字表現として結合した文字列を返す
    # 例： [0b100000, 0b111111]
    # ->
    # o- oo
    # -- oo
    # -- oo
    def stringify_tenjis(tenjis)
      output = ['', '', '']
      tenjis.map { stringify_tenji(_1) }.each do |tenji|
        tenji.split("\n").each_with_index do |row, index|
          output[index] << "#{row} "
        end
      end
      output.map(&:strip).join("\n")
    end
  end
end
