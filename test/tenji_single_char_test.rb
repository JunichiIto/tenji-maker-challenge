require 'minitest/autorun'
require_relative '../lib/tenji_single_char'

class TenjiSingleCharTest < Minitest::Test
  def setup
    @tenji_single = TenjiSingleChar.new
  end

  def test_a
    tenji = @tenji_single.to_tenji_single_array('A')
    assert_equal <<~TENJI.chomp, @tenji_single.show_tenji(tenji)
      o-
      --
      --
    TENJI
  end

  def test_i
    tenji = @tenji_single.to_tenji_single_array('I')
    assert_equal <<~TENJI.chomp, @tenji_single.show_tenji(tenji)
      o-
      o-
      --
    TENJI
  end

  def test_u
    tenji = @tenji_single.to_tenji_single_array('U')
    assert_equal <<~TENJI.chomp, @tenji_single.show_tenji(tenji)
      oo
      --
      --
    TENJI
  end

  def test_e
    tenji = @tenji_single.to_tenji_single_array('E')
    assert_equal <<~TENJI.chomp, @tenji_single.show_tenji(tenji)
      oo
      o-
      --
    TENJI
  end

  def test_o
    tenji = @tenji_single.to_tenji_single_array('O')
    assert_equal <<~TENJI.chomp, @tenji_single.show_tenji(tenji)
      -o
      o-
      --
    TENJI
  end

  def test_n
    tenji = @tenji_single.to_tenji_single_array('N')
    assert_equal <<~TENJI.chomp, @tenji_single.show_tenji(tenji)
      --
      -o
      oo
    TENJI
  end
end
