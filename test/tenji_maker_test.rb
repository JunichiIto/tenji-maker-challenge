require 'minitest/autorun'
require_relative '../lib/tenji_maker'

class TenjiMakerTest < Minitest::Test
  # ここから下のテストは変更不可 =====================
  def setup
    @tenji_maker = TenjiMaker.new
  end

  def test_a_hi_ru
    actual = @tenji_maker.to_tenji('A HI RU')
    assert_equal <<~TENJI.chomp, actual.chomp
      o- o- oo
      -- o- -o
      -- oo --
    TENJI
  end

  def test_ki_ri_n
    actual = @tenji_maker.to_tenji('KI RI N')
    assert_equal <<~TENJI.chomp, actual.chomp
      o- o- --
      o- oo -o
      -o -- oo
    TENJI
  end

  def test_si_ma_u_ma
    actual = @tenji_maker.to_tenji('SI MA U MA')
    assert_equal <<~TENJI.chomp, actual.chomp
      o- o- oo o-
      oo -o -- -o
      -o oo -- oo
    TENJI
  end

  def test_ni_wa_to_ri
    actual = @tenji_maker.to_tenji('NI WA TO RI')
    assert_equal <<~TENJI.chomp, actual.chomp
      o- -- -o o-
      o- -- oo oo
      o- o- o- --
    TENJI
  end

  def test_hi_yo_ko
    actual = @tenji_maker.to_tenji('HI YO KO')
    assert_equal <<~TENJI.chomp, actual.chomp
      o- -o -o
      o- -o o-
      oo o- -o
    TENJI
  end

  def test_ki_tu_ne
    actual = @tenji_maker.to_tenji('KI TU NE')
    assert_equal <<~TENJI.chomp, actual.chomp
      o- oo oo
      o- -o o-
      -o o- o-
    TENJI
  end
  # ここから上のテストは変更不可 =====================

  # 独自のテストパターンを追加するのは自由です
end
