#coding:utf-8
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

  # verified by http://www.hogera.com/pcb/cgi/tenji.cgi
  # あきすてのはみゆれを
  def test_all_unvoiced # 清音
    tenji = @tenji_maker.to_tenji('A KI SU TE NO HA MI YU RE WO')
    assert_equal <<~TENJI.chomp, tenji
      o- o- oo oo -o o- o- -o oo --
      -- o- -o oo o- -- oo -- oo -o
      -- -o -o o- o- oo oo oo -- o-
    TENJI
  end

  # がじづべぽ
  def test_voiced
    tenji = @tenji_maker.to_tenji('GA ZI DU BE PO')
    assert_equal <<~TENJI.chomp, tenji
      -- o- -- o- -- oo -- oo -- -o
      -o -- -o oo -o -o -o o- -- o-
      -- -o -- -o -- o- -- oo -o oo
    TENJI
  end

  # きゃしゅちょにゃひゅみょりゃ
  def test_contracted_1 # 拗音
    tenji = @tenji_maker.to_tenji('KYA SYU TYO NYA HYU MYO RYA')
    assert_equal <<~TENJI.chomp, tenji
      -o o- -o oo -o -o -o o- -o oo -o -o -o o-
      -- -- -- -o -- oo -- -- -- -- -- oo -- -o
      -- -o -- -o -- o- -- o- -- oo -- oo -- --
    TENJI
  end

  # ぎゅじょぢゃびゅぴょくぁつぃふぇぐぁヴィ
  def test_contracted_2 # 拗音
    tenji = @tenji_maker.to_tenji('GYU ZYO DYA BYU PYO KWA TSI FE GWA VI')
    assert_equal <<~TENJI.chomp, tenji
      -o oo -o -o -o o- -o oo -o -o -- o- -- o- -- oo -- o- -- o-
      -o -- -o oo -o -o -o -- -- o- o- -- o- oo o- o- oo -- oo o-
      -- -o -- -o -- o- -- oo -o oo -o -o -o o- -o oo -o -o -o oo
    TENJI
  end

  # こーもり
  def test_longvowel # 長音
    tenji = @tenji_maker.to_tenji('KO - MO RI')
    assert_equal <<~TENJI.chomp, tenji
      -o -- -o o-
      o- oo oo oo
      -o -- oo --
    TENJI
  end

  # 以下のテストはスペースを無視して入力する機能が必要です
  # てっか
  def test_geminate # 促音
    tenji = @tenji_maker.to_tenji('TEKKA')
    assert_equal <<~TENJI.chomp, tenji
      oo -- o-
      oo o- --
      o- -- -o
    TENJI
  end

  # しんい
  def test_syllabic_nasal_1 # 撥音
    tenji = @tenji_maker.to_tenji('SINNI')
    assert_equal <<~TENJI.chomp, tenji
      o- -- o-
      oo -o o-
      -o oo --
    TENJI
  end

  # しんに
  def test_syllabic_nasal_2 # 撥音
    tenji = @tenji_maker.to_tenji('SINNNI')
    assert_equal <<~TENJI.chomp, tenji
      o- -- o-
      oo -o o-
      -o oo o-
    TENJI
  end

  # braille symbol出力拡張
  def test_all_unvoiced_symbol
    tenji = @tenji_maker.to_braille('A KI SU TE NO HA MI YU RE WO')
    assert_equal <<~TENJI.chomp, tenji
      ⠁⠣⠹⠟⠎⠥⠷⠬⠛⠔
    TENJI
  end
end
