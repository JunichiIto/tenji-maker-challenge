require 'minitest/autorun'
require_relative '../lib/tenji_char_generator'

class TenjiCharGeneratorTest < Minitest::Test
  def setup
    @tenji_generator = TenjiCharGenerator.new
  end

  def test_a
    tenji = @tenji_generator.to_tenji('A')
    assert_equal <<~TENJI.chomp, tenji
      o-
      --
      --
    TENJI
  end

  def test_i
    tenji = @tenji_generator.to_tenji('I')
    assert_equal <<~TENJI.chomp, tenji
      o-
      o-
      --
    TENJI
  end

  def test_u
    tenji = @tenji_generator.to_tenji('U')
    assert_equal <<~TENJI.chomp, tenji
      oo
      --
      --
    TENJI
  end

  def test_e
    tenji = @tenji_generator.to_tenji('E')
    assert_equal <<~TENJI.chomp, tenji
      oo
      o-
      --
    TENJI
  end

  def test_o
    tenji = @tenji_generator.to_tenji('O')
    assert_equal <<~TENJI.chomp, tenji
      -o
      o-
      --
    TENJI
  end

  def test_ka
    tenji = @tenji_generator.to_tenji('KA')
    assert_equal <<~TENJI.chomp, tenji
      o-
      --
      -o
    TENJI
  end

  def test_ki
    tenji = @tenji_generator.to_tenji('KI')
    assert_equal <<~TENJI.chomp, tenji
      o-
      o-
      -o
    TENJI
  end

  def test_ku
    tenji = @tenji_generator.to_tenji('KU')
    assert_equal <<~TENJI.chomp, tenji
      oo
      --
      -o
    TENJI
  end

  def test_ke
    tenji = @tenji_generator.to_tenji('KE')
    assert_equal <<~TENJI.chomp, tenji
      oo
      o-
      -o
    TENJI
  end

  def test_ko
    tenji = @tenji_generator.to_tenji('KO')
    assert_equal <<~TENJI.chomp, tenji
      -o
      o-
      -o
    TENJI
  end

  def test_sa
    tenji = @tenji_generator.to_tenji('SA')
    assert_equal <<~TENJI.chomp, tenji
      o-
      -o
      -o
    TENJI
  end

  def test_si
    tenji = @tenji_generator.to_tenji('SI')
    assert_equal <<~TENJI.chomp, tenji
      o-
      oo
      -o
    TENJI
  end

  def test_su
    tenji = @tenji_generator.to_tenji('SU')
    assert_equal <<~TENJI.chomp, tenji
      oo
      -o
      -o
    TENJI
  end

  def test_se
    tenji = @tenji_generator.to_tenji('SE')
    assert_equal <<~TENJI.chomp, tenji
      oo
      oo
      -o
    TENJI
  end

  def test_so
    tenji = @tenji_generator.to_tenji('SO')
    assert_equal <<~TENJI.chomp, tenji
      -o
      oo
      -o
    TENJI
  end

  def test_ta
    tenji = @tenji_generator.to_tenji('TA')
    assert_equal <<~TENJI.chomp, tenji
      o-
      -o
      o-
    TENJI
  end

  def test_ti
    tenji = @tenji_generator.to_tenji('TI')
    assert_equal <<~TENJI.chomp, tenji
      o-
      oo
      o-
    TENJI
  end

  def test_tu
    tenji = @tenji_generator.to_tenji('TU')
    assert_equal <<~TENJI.chomp, tenji
      oo
      -o
      o-
    TENJI
  end

  def test_te
    tenji = @tenji_generator.to_tenji('TE')
    assert_equal <<~TENJI.chomp, tenji
      oo
      oo
      o-
    TENJI
  end

  def test_to
    tenji = @tenji_generator.to_tenji('TO')
    assert_equal <<~TENJI.chomp, tenji
      -o
      oo
      o-
    TENJI
  end

  def test_na
    tenji = @tenji_generator.to_tenji('NA')
    assert_equal <<~TENJI.chomp, tenji
      o-
      --
      o-
    TENJI
  end

  def test_ni
    tenji = @tenji_generator.to_tenji('NI')
    assert_equal <<~TENJI.chomp, tenji
      o-
      o-
      o-
    TENJI
  end

  def test_nu
    tenji = @tenji_generator.to_tenji('NU')
    assert_equal <<~TENJI.chomp, tenji
      oo
      --
      o-
    TENJI
  end

  def test_ne
    tenji = @tenji_generator.to_tenji('NE')
    assert_equal <<~TENJI.chomp, tenji
      oo
      o-
      o-
    TENJI
  end

  def test_no
    tenji = @tenji_generator.to_tenji('NO')
    assert_equal <<~TENJI.chomp, tenji
      -o
      o-
      o-
    TENJI
  end

  def test_ha
    tenji = @tenji_generator.to_tenji('HA')
    assert_equal <<~TENJI.chomp, tenji
      o-
      --
      oo
    TENJI
  end

  def test_hi
    tenji = @tenji_generator.to_tenji('HI')
    assert_equal <<~TENJI.chomp, tenji
      o-
      o-
      oo
    TENJI
  end

  def test_hu
    tenji = @tenji_generator.to_tenji('HU')
    assert_equal <<~TENJI.chomp, tenji
      oo
      --
      oo
    TENJI
  end

  def test_he
    tenji = @tenji_generator.to_tenji('HE')
    assert_equal <<~TENJI.chomp, tenji
      oo
      o-
      oo
    TENJI
  end

  def test_ho
    tenji = @tenji_generator.to_tenji('HO')
    assert_equal <<~TENJI.chomp, tenji
      -o
      o-
      oo
    TENJI
  end

  def test_ma
    tenji = @tenji_generator.to_tenji('MA')
    assert_equal <<~TENJI.chomp, tenji
      o-
      -o
      oo
    TENJI
  end

  def test_mi
    tenji = @tenji_generator.to_tenji('MI')
    assert_equal <<~TENJI.chomp, tenji
      o-
      oo
      oo
    TENJI
  end

  def test_mu
    tenji = @tenji_generator.to_tenji('MU')
    assert_equal <<~TENJI.chomp, tenji
      oo
      -o
      oo
    TENJI
  end

  def test_me
    tenji = @tenji_generator.to_tenji('ME')
    assert_equal <<~TENJI.chomp, tenji
      oo
      oo
      oo
    TENJI
  end

  def test_mo
    tenji = @tenji_generator.to_tenji('MO')
    assert_equal <<~TENJI.chomp, tenji
      -o
      oo
      oo
    TENJI
  end

  def test_ra
    tenji = @tenji_generator.to_tenji('RA')
    assert_equal <<~TENJI.chomp, tenji
      o-
      -o
      --
    TENJI
  end

  def test_ri
    tenji = @tenji_generator.to_tenji('RI')
    assert_equal <<~TENJI.chomp, tenji
      o-
      oo
      --
    TENJI
  end

  def test_ru
    tenji = @tenji_generator.to_tenji('RU')
    assert_equal <<~TENJI.chomp, tenji
      oo
      -o
      --
    TENJI
  end

  def test_re
    tenji = @tenji_generator.to_tenji('RE')
    assert_equal <<~TENJI.chomp, tenji
      oo
      oo
      --
    TENJI
  end

  def test_ro
    tenji = @tenji_generator.to_tenji('RO')
    assert_equal <<~TENJI.chomp, tenji
      -o
      oo
      --
    TENJI
  end

  def test_ya
    tenji = @tenji_generator.to_tenji('YA')
    assert_equal <<~TENJI.chomp, tenji
      -o
      --
      o-
    TENJI
  end

  def test_yu
    tenji = @tenji_generator.to_tenji('YU')
    assert_equal <<~TENJI.chomp, tenji
      -o
      --
      oo
    TENJI
  end

  def test_yo
    tenji = @tenji_generator.to_tenji('YO')
    assert_equal <<~TENJI.chomp, tenji
      -o
      -o
      o-
    TENJI
  end

  def test_wa
    tenji = @tenji_generator.to_tenji('WA')
    assert_equal <<~TENJI.chomp, tenji
      --
      --
      o-
    TENJI
  end
end
