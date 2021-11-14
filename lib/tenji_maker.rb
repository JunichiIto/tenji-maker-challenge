class TenjiMaker
  def to_tenji(text)
    translated_words = arranged_words(text.split)
      # translated_words
      # ex => [[["o", "-"], ["o", "-"], ["-", "o"]], ... ]
    puts_braille_by_line(translated_words)
  end

  def puts_braille_by_line(translated_words)
    output_text_line_1, output_text_line_2, output_text_line_3 = [], [], []
    translated_words.each do |word|
      output_text_line_1 << word[0].join + ' '
      output_text_line_2 << word[1].join + ' '
      output_text_line_3 << word[2].join + ' '
    end

    <<~TENJI.chomp
      #{ output_text_line_1.join.strip }
      #{ output_text_line_2.join.strip }
      #{ output_text_line_3.join.strip }
    TENJI
  end

  def arranged_words(entered_words)
    words = []
    entered_words.each do |word|
      if word.size == 1
        words << character(word)
        next
      end
      words << multiple_characters(word)
    end
    return words
  end

  def multiple_characters(word)
    split_word = word.split(//)
    if split_word.size == 2
      target_character = character(split_word.last)
      change_consonant(target_character, split_word.first)
      return target_character
    elsif split_word.size == 2
      # TODO 3文字のローマ字を点字に変換
    end
  end

  def character(word)
    case word
    when 'A'
      [['o','-'], ['-','-'], ['-','-']]
    when 'I'
      [['o','-'], ['o','-'], ['-','-']]
    when 'U'
      [['o','o'], ['-','-'], ['-','-']]
    when 'E'
      [['o','o'], ['o','-'], ['-','-']]
    when 'O'
      [['-','o'], ['o','-'], ['-','-']]
    when 'N'
      [['-','-'], ['-','o'], ['o','o']]
    end
  end

  def change_consonant(lists, character)
    case character
    when 'K'
      lists.map.with_index(1) do |vowel, index|
        vowel[0..1] = ['-','o'] if index == 3
      end
    when 'S'
      lists.map.with_index(1) do |vowel, index|
        vowel[1] = 'o' if index == 2
        vowel[0..1] = ['-','o'] if index == 3
      end
    when 'T'
      lists.map.with_index(1) do |vowel, index|
        vowel[1] = 'o' if index == 2
        vowel[0..1] = ['o','-'] if index == 3
      end
    when 'N'
      lists.map.with_index(1) do |vowel, index|
        vowel[0..1] = ['o','-'] if index == 3
      end
    when 'H'
      lists.map.with_index(1) do |vowel, index|
        vowel[0..1] = ['o','o'] if index == 3
      end
    when 'M'
      lists.map.with_index(1) do |vowel, index|
        vowel[1] = 'o' if index == 2
        vowel[0..1] = ['o','o']  if index == 3
      end
    when 'R'
      lists.map.with_index(1) do |vowel, index|
        vowel[1] = 'o' if index == 2
      end
    when 'Y'
      except_u = lists[0][0] == lists[0][1]
      lists.map.with_index(1) do |vowel, index|
        vowel[0..1] = ['-','o'] if index == 1
        vowel[0..1] = ['-','o'] if index == 2 && vowel.first == 'o'
        if index == 3 && except_u
          vowel[0..1] = ['o','o']
        elsif index == 3
          vowel[0..1] = ['o','-']
        end
      end
    when 'W'
      lists.map.with_index(1) do |vowel, index|
        vowel[0..1] = ['-','-'] if index == 1 
        vowel[0..1] = ['-','o'] if index == 2 && vowel.first == 'o'
        vowel[0..1] = ['o','-'] if index == 3
      end
    when 'N'
      lists.map.with_index(1) do |vowel, index|
        vowel[0..1] = ['-','-'] if index == 1 
        vowel[0..1] = ['-','o'] if index == 2
        vowel[0..1] = ['o','o'] if index == 3
      end
    end
  end
end
