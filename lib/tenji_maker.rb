require_relative '../lib/tenji_char_generator'

# 文字列を点字に変換するクラス
class TenjiMaker
  # コンストラクタ
  def initialize 
    @tenji_generator = TenjiCharGenerator.new
  end

  # 点字に変換したい文字列を取得し、点字に変換した文字列を表示する
  # @param [String] text 点字配列に変換するローマ字の文章(A HI RU,KA RA SU 等)
  # @return [Array] 2要素配列*3の点字配列
  def to_tenji(text)
    romaji_char_array = text.split(' ')
    tenji_array = text.split(' ').map { |romaji_char|
      @tenji_generator.to_tenji_char(romaji_char)
    }
    @tenji_generator.show_tenji(tenji_array)
  end

end
