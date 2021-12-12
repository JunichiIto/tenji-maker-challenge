require 'minitest/autorun'
require_relative '../lib/tenji_siin_char'

class TenjiSiinCharTest < Minitest::Test
  def setup
    @tenji_siin = TenjiSiinChar.new
  end

  def test_k
    tenji = @tenji_siin.to_tenji_siin_array('K')
    assert_equal <<~TENJI.chomp, @tenji_siin.show_tenji(tenji)
      --
      --
      -o
    TENJI
  end

  def test_s
    tenji = @tenji_siin.to_tenji_siin_array('S')
    assert_equal <<~TENJI.chomp, @tenji_siin.show_tenji(tenji)
      --
      -o
      -o
    TENJI
  end

  def test_t
    tenji = @tenji_siin.to_tenji_siin_array('T')
    assert_equal <<~TENJI.chomp, @tenji_siin.show_tenji(tenji)
      --
      -o
      o-
    TENJI
  end

  def test_n
    tenji = @tenji_siin.to_tenji_siin_array('N')
    assert_equal <<~TENJI.chomp, @tenji_siin.show_tenji(tenji)
      --
      --
      o-
    TENJI
  end

  def test_h
    tenji = @tenji_siin.to_tenji_siin_array('H')
    assert_equal <<~TENJI.chomp, @tenji_siin.show_tenji(tenji)
      --
      --
      oo
    TENJI
  end

  def test_m
    tenji = @tenji_siin.to_tenji_siin_array('M')
    assert_equal <<~TENJI.chomp, @tenji_siin.show_tenji(tenji)
      --
      -o
      oo
    TENJI
  end

  def test_r
    tenji = @tenji_siin.to_tenji_siin_array('R')
    assert_equal <<~TENJI.chomp, @tenji_siin.show_tenji(tenji)
      --
      -o
      --
    TENJI
  end

  def test_y
    tenji = @tenji_siin.to_tenji_siin_array('Y')
    assert_equal <<~TENJI.chomp, @tenji_siin.show_tenji(tenji)
      -o
      --
      --
    TENJI
  end

  def test_w
    tenji = @tenji_siin.to_tenji_siin_array('W')
    assert_equal <<~TENJI.chomp, @tenji_siin.show_tenji(tenji)
      --
      --
      --
    TENJI
  end
end
