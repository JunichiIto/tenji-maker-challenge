class ExtendTranslate
  module Tenji
    BASE_WORD = {
      A: 0b100000,
      I: 0b110000,
      U: 0b100100,
      E: 0b110100,
      O: 0b010100,
      N: 0b001011
    }.freeze

    EXCEPT_CONSONANT = {
      Y: 0b100000,
      W: 0b110000,
    }.freeze
  
    DEFINE_CONSONANT = {
      K: 0b000001,
      S: 0b000011,
      T: 0b001010,
      N: 0b001000,
      H: 0b001001,
      M: 0b001011,
      R: 0b000010,
      Y: {
        YA: 0b001100,
        YU: 0b001101,
        YO: 0b001110
      },
      W: {
        WA:  0b001000,
        WO:  0b001010,
      },
    }.freeze

    private

    def stringify_character_tenji(binary)
      chars = format('%06B', binary).each_char.map do |char|
        if char == "1"
          char.gsub!("1", 'o')
        elsif char == "0"
          char.gsub!("0", '-')
        end
      end
    end
  
    def stringify_characters_tenji(word)
      word_key, consonant_key, vowel_key = word.upcase.to_sym, word[0].upcase.to_sym, word[1].upcase.to_sym
      if EXCEPT_CONSONANT.include?(consonant_key)
        return stringify_character_tenji(DEFINE_CONSONANT[consonant_key][word_key])
      end

      stringify_character_tenji(DEFINE_CONSONANT[consonant_key] | BASE_WORD[vowel_key])
    end
  end
end