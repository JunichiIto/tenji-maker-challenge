require 'minitest/autorun'
require_relative '../lib/tenji_maker'

class TenjiMakerTest < Minitest::Test
  # ここから下のテストは変更不可 =====================
  def setup
    @tenji_maker = TenjiMaker.new
  end

  def test_a_hi_ru
    tenji = @tenji_maker.to_tenji('A HI RU')
    assert_equal <<~TENJI.chomp, tenji
      o- o- oo
      -- o- -o
      -- oo --
    TENJI
  end

  def test_ki_ri_n
    tenji = @tenji_maker.to_tenji('KI RI N')
    assert_equal <<~TENJI.chomp, tenji
      o- o- --
      o- oo -o
      -o -- oo
    TENJI
  end

  def test_si_ma_u_ma
    tenji = @tenji_maker.to_tenji('SI MA U MA')
    assert_equal <<~TENJI.chomp, tenji
      o- o- oo o-
      oo -o -- -o
      -o oo -- oo
    TENJI
  end

  def test_ni_wa_to_ri
    tenji = @tenji_maker.to_tenji('NI WA TO RI')
    assert_equal <<~TENJI.chomp, tenji
      o- -- -o o-
      o- -- oo oo
      o- o- o- --
    TENJI
  end

  def test_hi_yo_ko
    tenji = @tenji_maker.to_tenji('HI YO KO')
    assert_equal <<~TENJI.chomp, tenji
      o- -o -o
      o- -o o-
      oo o- -o
    TENJI
  end

  def test_ki_tu_ne
    tenji = @tenji_maker.to_tenji('KI TU NE')
    assert_equal <<~TENJI.chomp, tenji
      o- oo oo
      o- -o o-
      -o o- o-
    TENJI
  end
  # ここから上のテストは変更不可 =====================

  # 独自のテストパターンを追加するのは自由です

  def test_a_binary
    binary_letter = @tenji_maker.send(:letter_to_tenji_binary, 'A')
    assert_equal [1, 0, 0, 0, 0, 0], binary_letter
  end

  def test_ki_binary
    binary_letter = @tenji_maker.send(:letter_to_tenji_binary, 'KI')
    assert_equal [1, 1, 0, 0, 0, 1], binary_letter
  end

  def test_su_binary
    binary_letter = @tenji_maker.send(:letter_to_tenji_binary, 'SU')
    assert_equal [1, 0, 0, 1, 1, 1], binary_letter
  end

  def test_te_binary
    binary_letter = @tenji_maker.send(:letter_to_tenji_binary, 'TE')
    assert_equal [1, 1, 1, 1, 1, 0], binary_letter
  end

  def test_no_binary
    binary_letter = @tenji_maker.send(:letter_to_tenji_binary, 'NO')
    assert_equal [0, 1, 1, 1, 0, 0], binary_letter
  end

  def test_ha_binary
    binary_letter = @tenji_maker.send(:letter_to_tenji_binary, 'HA')
    assert_equal [1, 0, 1, 0, 0, 1], binary_letter
  end

  def test_mi_binary
    binary_letter = @tenji_maker.send(:letter_to_tenji_binary, 'MI')
    assert_equal [1, 1, 1, 0, 1, 1], binary_letter
  end

  def test_n_binary
    binary_letter = @tenji_maker.send(:letter_to_tenji_binary, 'N')
    assert_equal [0, 0, 1, 0, 1, 1], binary_letter
  end

  def test_ya_binary
    binary_letter = @tenji_maker.send(:letter_to_tenji_binary, 'YA')
    assert_equal [0, 0, 1, 1, 0, 0], binary_letter
  end
end
