require 'minitest/autorun'
require_relative '../lib/tenji_boin'

# 点字母音の生成テスト
class TenjiBoinTest < Minitest::Test
  def setup
    @tenji_boin = TenjiBoin.new
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
end
