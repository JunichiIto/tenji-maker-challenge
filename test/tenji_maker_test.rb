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
  def test_n
    tenji = @tenji_maker.to_tenji('N')
    assert_equal <<~TENJI.chomp, tenji
      --
      -o
      oo
    TENJI
  end

  def test_a
    tenji = @tenji_maker.to_tenji('A')
    assert_equal <<~TENJI.chomp, tenji
      o-
      --
      --
    TENJI
  end

  def test_i
    tenji = @tenji_maker.to_tenji('I')
    assert_equal <<~TENJI.chomp, tenji
      o-
      o-
      --
    TENJI
  end

  def test_u
    tenji = @tenji_maker.to_tenji('U')
    assert_equal <<~TENJI.chomp, tenji
      oo
      --
      --
    TENJI
  end

  def test_e
    tenji = @tenji_maker.to_tenji('E')
    assert_equal <<~TENJI.chomp, tenji
      oo
      o-
      --
    TENJI
  end

  def test_o
    tenji = @tenji_maker.to_tenji('O')
    assert_equal <<~TENJI.chomp, tenji
      -o
      o-
      --
    TENJI
  end

  def test_a_i_u_e_o
    tenji = @tenji_maker.to_tenji('A I U E O')
    assert_equal <<~TENJI.chomp, tenji
      o- o- oo oo -o
      -- o- -- o- o-
      -- -- -- -- --
    TENJI
  end

  def test_ya
    tenji = @tenji_maker.to_tenji('YA')
    assert_equal <<~TENJI.chomp, tenji
      -o
      --
      o-
    TENJI
  end

  def test_yu
    tenji = @tenji_maker.to_tenji('YU')
    assert_equal <<~TENJI.chomp, tenji
      -o
      --
      oo
    TENJI
  end

  def test_yo
    tenji = @tenji_maker.to_tenji('YO')
    assert_equal <<~TENJI.chomp, tenji
      -o
      -o
      o-
    TENJI
  end

  def test_ya_yu_yo
    tenji = @tenji_maker.to_tenji('YA YU YO')
    assert_equal <<~TENJI.chomp, tenji
      -o -o -o
      -- -- -o
      o- oo o-
    TENJI
  end

  def test_wa
    tenji = @tenji_maker.to_tenji('WA')
    assert_equal <<~TENJI.chomp, tenji
      --
      --
      o-
    TENJI
  end

  def test_wo
    tenji = @tenji_maker.to_tenji('WO')
    assert_equal <<~TENJI.chomp, tenji
      --
      -o
      o-
    TENJI
  end

  def test_wa_wo_n
    tenji = @tenji_maker.to_tenji('WA WO N')
    assert_equal <<~TENJI.chomp, tenji
      -- -- --
      -- -o -o
      o- o- oo
    TENJI
  end
end
