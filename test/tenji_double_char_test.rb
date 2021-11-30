require 'minitest/autorun'
require_relative '../lib/tenji_double_char'

class TenjiDoubleCharTest < Minitest::Test
  def setup
    @tenji_double = TenjiDoubleChar.new
  end

  def test_k
    tenji = @tenji_double.to_tenji_double_array('K')
    assert_equal <<~TENJI.chomp, @tenji_double.show_tenji(tenji)
      --
      --
      -o
    TENJI
  end

  def test_s
    tenji = @tenji_double.to_tenji_double_array('S')
    assert_equal <<~TENJI.chomp, @tenji_double.show_tenji(tenji)
      --
      -o
      -o
    TENJI
  end

  def test_t
    tenji = @tenji_double.to_tenji_double_array('T')
    assert_equal <<~TENJI.chomp, @tenji_double.show_tenji(tenji)
      --
      -o
      o-
    TENJI
  end

  def test_n
    tenji = @tenji_double.to_tenji_double_array('N')
    assert_equal <<~TENJI.chomp, @tenji_double.show_tenji(tenji)
      --
      --
      o-
    TENJI
  end

  def test_h
    tenji = @tenji_double.to_tenji_double_array('H')
    assert_equal <<~TENJI.chomp, @tenji_double.show_tenji(tenji)
      --
      --
      oo
    TENJI
  end

  def test_m
    tenji = @tenji_double.to_tenji_double_array('M')
    assert_equal <<~TENJI.chomp, @tenji_double.show_tenji(tenji)
      --
      -o
      oo
    TENJI
  end

  def test_r
    tenji = @tenji_double.to_tenji_double_array('R')
    assert_equal <<~TENJI.chomp, @tenji_double.show_tenji(tenji)
      --
      -o
      --
    TENJI
  end

  def test_y
    tenji = @tenji_double.to_tenji_double_array('Y')
    assert_equal <<~TENJI.chomp, @tenji_double.show_tenji(tenji)
      -o
      --
      --
    TENJI
  end

  def test_w
    tenji = @tenji_double.to_tenji_double_array('W')
    assert_equal <<~TENJI.chomp, @tenji_double.show_tenji(tenji)
      --
      --
      --
    TENJI
  end
end
