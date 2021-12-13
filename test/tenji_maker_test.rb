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

  # っ：「きって」
  def test_ki_xtu_te
    tenji = @tenji_maker.to_tenji('KI XTU TE')
    assert_equal <<~TENJI.chomp, tenji
      o- -- oo
      o- o- oo
      -o -- o-
    TENJI
  end

  # ー：「レース」
  def test_re___su
    tenji = @tenji_maker.to_tenji('RE - SU')
    assert_equal <<~TENJI.chomp, tenji
      oo -- oo
      oo oo -o
      -- -- -o
    TENJI
  end

  # 。：「はい。」
  def test_ha_i_maru
    tenji = @tenji_maker.to_tenji('HA I .')
    assert_equal <<~TENJI.chomp, tenji
      o- o- --
      -- o- oo
      oo -- -o
    TENJI
  end

  # 濁点・半濁点：「がじづべぽ」
  def test_ga_zi_du_be_bo
    tenji = @tenji_maker.to_tenji('GA ZI DU BE PO')
    assert_equal <<~TENJI.chomp, tenji
      -- o- -- o- -- oo -- oo -- -o
      -o -- -o oo -o -o -o o- -- o-
      -- -o -- -o -- o- -- oo -o oo
    TENJI
  end

  # 拗音：「きゃしゅちょ」
  def test_kya_syu_tyo
    tenji = @tenji_maker.to_tenji('KYA SYU TYO')
    assert_equal <<~TENJI.chomp, tenji
      -o o- -o oo -o -o
      -- -- -- -o -- oo
      -- -o -- -o -- o-
    TENJI
  end

  # 濁点・半濁点＋拗音：「ぎゃじゅぴょ」
  def test_gya_zyu_pyo
    tenji = @tenji_maker.to_tenji('GYA ZYU PYO')
    assert_equal <<~TENJI.chomp, tenji
      -o o- -o oo -o -o
      -o -- -o -o -- o-
      -- -o -- -o -o oo
    TENJI
  end
end
