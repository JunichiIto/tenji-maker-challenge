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
    when /.[Y]/
      letter.sub(/Y/,'y')
    when /N$/
      letter.rjust(2,letter).downcase
    else
      letter
    end
  end

    TB = {
      'A'=>0b100000, 'I'=>0b101000, 'U'=>0b110000, 'E'=>0b111000, 'O'=>0b011000,
      'a'=>0b000010, 'u'=>0b000011, 'o'=>0b000110,
      'K'=>0b000001, 'S'=>0b000101, 'T'=>0b000110, 'N'=>0b000010, 'H'=>0b000011, 
      'M'=>0b000111, 'Y'=>0b010000, 'R'=>0b000100, 'W'=>0b000000,
      'n'=>0b000111, '_'=>0b000000, 
    }
  def translate(letter)
    val = letter.scan(/./).map{|c| TB[c]}.inject(:|).to_s(2)
    len = (val.length > 6) ? 12 : 6
    (val.chars.map &{"0"=>"-","1"=>"o"}).join.rjust(len,'-')
  end

  def split_and_normalize_letter(text)
    text.split(' ').map {|letter| normalize letter}
  end
  
  def translate_letters_to_tenji(letters)
    letters.map {|letter| (translate letter).scan(/.{6}/)}.flatten
  end

  def render(tenji)
    (0..2).map {|i| tenji.map {|s| s.slice(i * 2,2)}.join(' ')}.join("\n")
  end
end
