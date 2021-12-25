require_relative 'tenji_maker/extend_translate'

class TenjiMaker
  include ExtendTranslate::Tenji

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
        stringify_two_characters_tenji(word.upcase)
      when 3
        # TODO: stringify_three_characters_tenji()
      end
    end
  end

  def puts_braille_by_line(translated_words)
    output_text_1, output_text_2, output_text_3 = '', '', ''
    translated_words.each do |word|
      output_text_1 << "#{ word[0] + word[3] + " " }"
      output_text_2 << "#{ word[1] + word[4] + " " }"
      output_text_3 << "#{ word[2] + word[5] + " " }"
    end
    <<~TENJI.chomp
      #{ output_text_1.strip }
      #{ output_text_2.strip }
      #{ output_text_3.strip }
    TENJI
  end
end
