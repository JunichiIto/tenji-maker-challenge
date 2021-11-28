# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../lib/tenji_maker'

# Class to check at a minimum
class TenjiMakerGivenTest < Minitest::Test
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
end

# Class to check invalid inputs and all tokens
class TenjiMakerMyTest < Minitest::Test
  def setup
    @tenji_maker = TenjiMaker.new
  end

  def test_wo
    assert_raises InvalidRomaji do
      @tenji_maker.to_tenji('WO')
    end
  end

  def test_b
    assert_raises InvalidRomaji do
      @tenji_maker.to_tenji('B')
    end
  end

  def test_empty
    tenji = @tenji_maker.to_tenji('')
    assert_equal "\n" * 2, tenji
  end

  def test_a_i_u_e_o
    tenji = @tenji_maker.to_tenji('A I U E O')
    assert_equal <<~TENJI.chomp, tenji
      o- o- oo oo -o
      -- o- -- o- o-
      -- -- -- -- --
    TENJI
  end

  def test_ka_ki_ku_ke_ko
    tenji = @tenji_maker.to_tenji('KA KI KU KE KO')
    assert_equal <<~TENJI.chomp, tenji
      o- o- oo oo -o
      -- o- -- o- o-
      -o -o -o -o -o
    TENJI
  end

  def test_sa_si_su_se_so
    tenji = @tenji_maker.to_tenji('SA SI SU SE SO')
    assert_equal <<~TENJI.chomp, tenji
      o- o- oo oo -o
      -o oo -o oo oo
      -o -o -o -o -o
    TENJI
  end

  def test_ta_ti_tu_te_to
    tenji = @tenji_maker.to_tenji('TA TI TU TE TO')
    assert_equal <<~TENJI.chomp, tenji
      o- o- oo oo -o
      -o oo -o oo oo
      o- o- o- o- o-
    TENJI
  end

  def test_na_ni_nu_ne_no
    tenji = @tenji_maker.to_tenji('NA NI NU NE NO')
    assert_equal <<~TENJI.chomp, tenji
      o- o- oo oo -o
      -- o- -- o- o-
      o- o- o- o- o-
    TENJI
  end

  def test_ha_hi_hu_he_ho
    tenji = @tenji_maker.to_tenji('HA HI HU HE HO')
    assert_equal <<~TENJI.chomp, tenji
      o- o- oo oo -o
      -- o- -- o- o-
      oo oo oo oo oo
    TENJI
  end

  def test_ma_mi_mu_me_mo
    tenji = @tenji_maker.to_tenji('MA MI MU ME MO')
    assert_equal <<~TENJI.chomp, tenji
      o- o- oo oo -o
      -o oo -o oo oo
      oo oo oo oo oo
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

  def test_ra_ri_ru_re_ro
    tenji = @tenji_maker.to_tenji('RA RI RU RE RO')
    assert_equal <<~TENJI.chomp, tenji
      o- o- oo oo -o
      -o oo -o oo oo
      -- -- -- -- --
    TENJI
  end

  def test_wa_n
    tenji = @tenji_maker.to_tenji('WA N')
    assert_equal <<~TENJI.chomp, tenji
      -- --
      -- -o
      o- oo
    TENJI
  end

  def test_nn
    assert_raises InvalidRomaji do
      @tenji_maker.to_tenji('NN')
    end
  end
end
