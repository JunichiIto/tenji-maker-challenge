class Tenji
  def initialize(str)
    @str = str
  end

  def to_h
    if consonant.nil? # あ行
      send(vowel.downcase)
    elsif %w[K S T N H M R].include?(consonant) && vowel
      send(vowel.downcase).merge(send(consonant.downcase))
    elsif %w[Y W].include?(consonant)
      send(str.downcase)
    elsif %w[N].include?(consonant) && vowel.nil? # ん
      N
    end
  end

  private

  attr_reader :str

  def vowel
    if str.length == 2
      str[1]
    elsif str == "N"
      nil
    elsif str.length == 1
      str[0]
    end
  end

  def consonant
    if str.length == 2
      str[0]
    elsif str == "N"
      str[0]
    elsif str.length == 1
      nil
    end
  end

  def a
    {
      1 => "o", 4 => "-",
      2 => "-", 5 => "-",
      3 => "-", 6 => "-",
    }
  end

  def i
    {
      1 => "o", 4 => "-",
      2 => "o", 5 => "-",
      3 => "-", 6 => "-",
    }
  end

  def u
    {
      1 => "o", 4 => "o",
      2 => "-", 5 => "-",
      3 => "-", 6 => "-",
    }
  end

  def e
    {
      1 => "o", 4 => "o",
      2 => "o", 5 => "-",
      3 => "-", 6 => "-",
    }
  end

  def o
    {
      1 => "-", 4 => "o",
      2 => "o", 5 => "-",
      3 => "-", 6 => "-",
    }
  end

  def k
    {
      5 => "-",
      3 => "-", 6 => "o",
    }
  end

  def s
    {
      5 => "o",
      3 => "-", 6 => "o",
    }
  end

  def t
    {
      5 => "o",
      3 => "o", 6 => "-",
    }
  end

  def n
    {
      5 => "-",
      3 => "o", 6 => "-",
    }
  end

  def h
    {
      5 => "-",
      3 => "o", 6 => "o",
    }
  end

  def m
    {
      5 => "o",
      3 => "o", 6 => "o",
    }
  end

  def r
    {
      5 => "o",
      3 => "-", 6 => "-",
    }
  end

  def ya
    {
      1 => "-", 4 => "o",
      2 => "-", 5 => "-",
      3 => "o", 6 => "-",
    }
  end

  def yu
    {
      1 => "-", 4 => "o",
      2 => "-", 5 => "-",
      3 => "o", 6 => "o",
    }
  end

  def yo
    {
      1 => "-", 4 => "o",
      2 => "-", 5 => "o",
      3 => "o", 6 => "-",
    }
  end

  def wa
    {
      1 => "-", 4 => "-",
      2 => "-", 5 => "-",
      3 => "o", 6 => "-",
    }
  end

  N =
    {
      1 => "-", 4 => "-",
      2 => "-", 5 => "o",
      3 => "o", 6 => "o",
    }.freeze
end
