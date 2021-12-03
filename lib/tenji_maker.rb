require_relative '../lib/tenji_char_generator'

# 文字列を点字に変換するクラス
class TenjiMaker
  # コンストラクタ
  def initialize 
    @tenji_generator = TenjiCharGenerator.new
  end

  # 点字に変換したい文字列を取得し、点字に変換した文字列を表示する
  #
  # @example 'A HI RU'を点字に変換する
  #   to_tenji_double_array('A HI RU')
  #   #=> o- o- oo
  #       -- o- -o
  #       -- oo --
  #
  # @param [String] text 点字に変換するローマ字の文章('A HI RU','KA RA SU' 等)
  # @return [String] 点字の間をスペースで区切った文字文字列
  def to_tenji(text)
    romaji_char_array = text.split(' ')
    tenji_array = text.split(' ').map { |romaji_char|
      @tenji_generator.to_tenji_char_array(romaji_char)
    }
    @tenji_generator.show_tenji(tenji_array)
  end

end
