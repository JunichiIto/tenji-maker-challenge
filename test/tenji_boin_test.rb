require 'minitest/autorun'
require_relative '../lib/tenji_maker'

class TenjiBoinTest < Minitest::Test
  def setup
    @tenji_maker = TenjiMaker.new
  end

  # 母音が正しく生成できるか
  def test_a
    tenji = @tenji_maker.to_tenji('A')
    assert_equal <<~TENJI.chomp, tenji
      o-
      --
      --
    TENJI
  end

  def test_i
    tenji = @tenji_maker.to_tenji('I')
    assert_equal <<~TENJI.chomp, tenji
      o-
      o-
      --
    TENJI
  end

  def test_u
    tenji = @tenji_maker.to_tenji('U')
    assert_equal <<~TENJI.chomp, tenji
      oo
      --
      --
    TENJI
  end

  def test_e
    tenji = @tenji_maker.to_tenji('E')
    assert_equal <<~TENJI.chomp, tenji
      oo
      o-
      --
    TENJI
  end

  def test_o
    tenji = @tenji_maker.to_tenji('O')
    assert_equal <<~TENJI.chomp, tenji
      -o
      o-
      --
    TENJI
  end
end
