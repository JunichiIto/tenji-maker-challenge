require_relative 'tenji_maker/extend_code'

class TenjiMaker
  include ExtendDefineCode::Tenji

  def to_tenji(text)
    translated_words = arranged_words(text.split)
      # ex => [["o", "-", "o", "-", "-", "o"], ... ]
    puts_braille_by_line(translated_words)
  end

  private

  def arranged_words(entered_words)
    output_words = entered_words.map do |word|
      case word.size
      when 1
        stringify_character_tenji(BASE_WORD[word.upcase.to_sym])
      when 2
        stringify_characters_tenji(word)
      when 3
        # TODO
      end
    end
  end

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
    word_key = word.upcase.to_sym
    consonant_key = word[0].upcase.to_sym
    vowel_key = word[1].upcase.to_sym
    has_except_consonant = DEFINE_CONSONANT.dig(consonant_key, word_key)
    return stringify_character_tenji(DEFINE_CONSONANT[consonant_key][word_key]) if has_except_consonant

    stringify_character_tenji(DEFINE_CONSONANT[consonant_key] | BASE_WORD[vowel_key])
  end

  def puts_braille_by_line(translated_words)
    p translated_words
    # TODO Fix output format
    output_text_line_1, output_text_line_2, output_text_line_3 = [], [], []
    translated_words.each_with_index do |word, i|
      output_text_line_1 << word[0] + word[3]
      output_text_line_2 << word[1] + word[4]
      output_text_line_3 << word[2] + word[5]
    end

    <<~TENJI.chomp
      #{ output_text_line_1.join.strip }
      #{ output_text_line_2.join.strip }
      #{ output_text_line_3.join.strip }
    TENJI
  end
end

a = TenjiMaker.new
p a.to_tenji('ya yu yo')
p a.to_tenji('a i u')