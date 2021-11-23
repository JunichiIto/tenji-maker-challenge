require 'minitest/autorun'
require_relative '../lib/tenji_single_char'

# 点字母音の生成テスト
class TenjiSingleCharTest < Minitest::Test
  def setup
    @tenji_boin = TenjiSingleChar.new
  end

  def test_a
    tenji = @tenji_boin.to_tenji_boin_array('A')
    assert_equal <<~TENJI.chomp, @tenji_boin.show_tenji(tenji)
      o-
      --
      --
    TENJI
  end

  def test_i
    tenji = @tenji_boin.to_tenji_boin_array('I')
    assert_equal <<~TENJI.chomp, @tenji_boin.show_tenji(tenji)
      o-
      o-
      --
    TENJI
  end

  def test_u
    tenji = @tenji_boin.to_tenji_boin_array('U')
    assert_equal <<~TENJI.chomp, @tenji_boin.show_tenji(tenji)
      oo
      --
      --
    TENJI
  end

  def test_e
    tenji = @tenji_boin.to_tenji_boin_array('E')
    assert_equal <<~TENJI.chomp, @tenji_boin.show_tenji(tenji)
      oo
      o-
      --
    TENJI
  end

  def test_o
    tenji = @tenji_boin.to_tenji_boin_array('O')
    assert_equal <<~TENJI.chomp, @tenji_boin.show_tenji(tenji)
      -o
      o-
      --
    TENJI
  end

  def test_n
    tenji = @tenji_boin.to_tenji_boin_array('N')
    assert_equal <<~TENJI.chomp, @tenji_boin.show_tenji(tenji)
      --
      -o
      oo
    TENJI
  end
end
