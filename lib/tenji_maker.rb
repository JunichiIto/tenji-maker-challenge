class TenjiMaker
  def to_tenji(text)
    letters = split_and_normalize_letter text
    tenji = translate_letters_to_tenji letters
    render tenji
  end

  private
  def normalize(letter)
    case letter
    when /^[YW]/
      letter.capitalize
    when /^[AIUEO]/
      letter.rjust(2,'_')
    when /N$/
      letter.rjust(2,letter).downcase
    else
      letter
    end
  end

    TB = {
      'A'=>0b100111, 'I'=>0b101111, 'U'=>0b110111, 'E'=>0b111111, 'O'=>0b011111,
      'a'=>0b010010, 'u'=>0b010011, 'o'=>0b010110,
      'K'=>0b111001, 'S'=>0b111101, 'T'=>0b111110, 'N'=>0b111010, 'H'=>0b111011, 
      'M'=>0b111111, 'Y'=>0b010111, 'R'=>0b111100, 'W'=>0b001111,
      'n'=>0b000111, '_'=>0b111000, 
    }
  def translate(letter)
    c, v = letter.scan(/./)
    (TB[c] & TB[v]).to_s(2).rjust(6,'0').gsub('0','-').gsub('1','o')
  end

  def split_and_normalize_letter(text)
    text.split(' ').map {|letter| normalize letter}
  end
  
  def translate_letters_to_tenji(letters)
    letters.map {|letter| translate letter}
  end

  def render(tenji)
    (0..2).map {|i| tenji.map {|s| s.slice(i * 2,2)}.join(' ')}.join("\n")
  end
end
