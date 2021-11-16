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

  # 鳥啼歌（50音を全て使った文章）
  def test_torinakuuta
    # 鳥鳴く声す 夢覚ませ 見よ明け渡る 東(を) 空色映えて 沖つ辺に 帆舟群れ居ぬ 靄の内
    tenji = @tenji_maker.to_tenji('TO RI NA KU KO E SU YU ME SA MA SE MI YO A KE WA TA RU HI N KA SI SO RA I RO HA E TE O KI TU HE NI HO HU NE MU RE I NU MO YA NO U TI')
    assert_equal <<~TENJI.chomp, tenji
      -o oo o- oo -o oo oo -o oo o- o- oo o- -o o- oo -- o- oo o- -- o- o- -o o- o- -o o- oo oo -o o- oo oo o- -o oo oo oo oo o- oo -o -o -o oo o-
      oo o- -- -- o- o- -o -- oo -o -o oo oo -o -- o- -- -o -o o- -o -- oo oo -o o- oo -- o- oo o- o- -o o- o- o- -- o- -o oo o- -- oo -- o- -- oo
      o- -- o- -o -o -- -o oo oo -o oo -o oo o- -- -o o- o- -- oo oo -o -o -o -- -- -- oo -- o- -- -o o- oo o- oo oo o- oo -- -- o- oo o- o- -- o-
    TENJI
  end
end
