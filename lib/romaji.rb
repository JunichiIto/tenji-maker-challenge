class Romaji
  attr_reader :char

  def initialize(char)
    @char = char
  end

  def length
    char.length
  end

  # 母音(末尾の文字)
  def vowel
    char[-1]  end

  # 子音(2文字以上の場合は末尾の文字だけ除けば子音となる)
  def consonant
    length >= 2 ? char[0..-2] : ''
  end
end
