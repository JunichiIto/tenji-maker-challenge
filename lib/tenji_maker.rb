require_relative '../lib/tenji_char_generator'

class TenjiMaker

  def initialize 
    @tenji_generator = TenjiCharGenerator.new
  end

  def to_tenji(text)
    romaji_char_array = text.split(' ')
    tenji_array = text.split(' ').map { |romaji_char|
      @tenji_generator.to_tenji_char(romaji_char)
    }
    @tenji_generator.show_tenji(tenji_array)
  end

end
