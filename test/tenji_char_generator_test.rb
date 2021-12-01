require 'minitest/autorun'
require_relative '../lib/tenji_char_generator'

class TenjiCharGeneratorTest < Minitest::Test
  def setup
    @tenji_generator = TenjiCharGenerator.new
  end

  def test_a
    tenji = @tenji_generator.to_tenji_char('A')
    assert_equal <<~TENJI.chomp, @tenji_generator.show_tenji(tenji)
      o-
      --
      --
    TENJI
  end

  def test_i
    tenji = @tenji_generator.to_tenji_char('I')
    assert_equal <<~TENJI.chomp, @tenji_generator.show_tenji(tenji)
      o-
      o-
      --
    TENJI
  end

  def test_u
    tenji = @tenji_generator.to_tenji_char('U')
    assert_equal <<~TENJI.chomp, @tenji_generator.show_tenji(tenji)
      oo
      --
      --
    TENJI
  end

  def test_e
    tenji = @tenji_generator.to_tenji_char('E')
    assert_equal <<~TENJI.chomp, @tenji_generator.show_tenji(tenji)
      oo
      o-
      --
    TENJI
  end

  def test_o
    tenji = @tenji_generator.to_tenji_char('O')
    assert_equal <<~TENJI.chomp, @tenji_generator.show_tenji(tenji)
      -o
      o-
      --
    TENJI
  end

  def test_ka
    tenji = @tenji_generator.to_tenji_char('KA')
    assert_equal <<~TENJI.chomp, @tenji_generator.show_tenji(tenji)
      o-
      --
      -o
    TENJI
  end

  def test_ki
    tenji = @tenji_generator.to_tenji_char('KI')
    assert_equal <<~TENJI.chomp, @tenji_generator.show_tenji(tenji)
      o-
      o-
      -o
    TENJI
  end

  def test_ku
    tenji = @tenji_generator.to_tenji_char('KU')
    assert_equal <<~TENJI.chomp, @tenji_generator.show_tenji(tenji)
      oo
      --
      -o
    TENJI
  end

  def test_ke
    tenji = @tenji_generator.to_tenji_char('KE')
    assert_equal <<~TENJI.chomp, @tenji_generator.show_tenji(tenji)
      oo
      o-
      -o
    TENJI
  end

  def test_ko
    tenji = @tenji_generator.to_tenji_char('KO')
    assert_equal <<~TENJI.chomp, @tenji_generator.show_tenji(tenji)
      -o
      o-
      -o
    TENJI
  end

  def test_sa
    tenji = @tenji_generator.to_tenji_char('SA')
    assert_equal <<~TENJI.chomp, @tenji_generator.show_tenji(tenji)
      o-
      -o
      -o
    TENJI
  end

  def test_si
    tenji = @tenji_generator.to_tenji_char('SI')
    assert_equal <<~TENJI.chomp, @tenji_generator.show_tenji(tenji)
      o-
      oo
      -o
    TENJI
  end

  def test_su
    tenji = @tenji_generator.to_tenji_char('SU')
    assert_equal <<~TENJI.chomp, @tenji_generator.show_tenji(tenji)
      oo
      -o
      -o
    TENJI
  end

  def test_se
    tenji = @tenji_generator.to_tenji_char('SE')
    assert_equal <<~TENJI.chomp, @tenji_generator.show_tenji(tenji)
      oo
      oo
      -o
    TENJI
  end

  def test_so
    tenji = @tenji_generator.to_tenji_char('SO')
    assert_equal <<~TENJI.chomp, @tenji_generator.show_tenji(tenji)
      -o
      oo
      -o
    TENJI
  end

  def test_ta
    tenji = @tenji_generator.to_tenji_char('TA')
    assert_equal <<~TENJI.chomp, @tenji_generator.show_tenji(tenji)
      o-
      -o
      o-
    TENJI
  end

  def test_ti
    tenji = @tenji_generator.to_tenji_char('TI')
    assert_equal <<~TENJI.chomp, @tenji_generator.show_tenji(tenji)
      o-
      oo
      o-
    TENJI
  end

  def test_tu
    tenji = @tenji_generator.to_tenji_char('TU')
    assert_equal <<~TENJI.chomp, @tenji_generator.show_tenji(tenji)
      oo
      -o
      o-
    TENJI
  end

  def test_te
    tenji = @tenji_generator.to_tenji_char('TE')
    assert_equal <<~TENJI.chomp, @tenji_generator.show_tenji(tenji)
      oo
      oo
      o-
    TENJI
  end

  def test_to
    tenji = @tenji_generator.to_tenji_char('TO')
    assert_equal <<~TENJI.chomp, @tenji_generator.show_tenji(tenji)
      -o
      oo
      o-
    TENJI
  end

  def test_na
    tenji = @tenji_generator.to_tenji_char('NA')
    assert_equal <<~TENJI.chomp, @tenji_generator.show_tenji(tenji)
      o-
      --
      o-
    TENJI
  end

  def test_ni
    tenji = @tenji_generator.to_tenji_char('NI')
    assert_equal <<~TENJI.chomp, @tenji_generator.show_tenji(tenji)
      o-
      o-
      o-
    TENJI
  end

  def test_nu
    tenji = @tenji_generator.to_tenji_char('NU')
    assert_equal <<~TENJI.chomp, @tenji_generator.show_tenji(tenji)
      oo
      --
      o-
    TENJI
  end

  def test_ne
    tenji = @tenji_generator.to_tenji_char('NE')
    assert_equal <<~TENJI.chomp, @tenji_generator.show_tenji(tenji)
      oo
      o-
      o-
    TENJI
  end

  def test_no
    tenji = @tenji_generator.to_tenji_char('NO')
    assert_equal <<~TENJI.chomp, @tenji_generator.show_tenji(tenji)
      -o
      o-
      o-
    TENJI
  end

  def test_ha
    tenji = @tenji_generator.to_tenji_char('HA')
    assert_equal <<~TENJI.chomp, @tenji_generator.show_tenji(tenji)
      o-
      --
      oo
    TENJI
  end

  def test_hi
    tenji = @tenji_generator.to_tenji_char('HI')
    assert_equal <<~TENJI.chomp, @tenji_generator.show_tenji(tenji)
      o-
      o-
      oo
    TENJI
  end

  def test_hu
    tenji = @tenji_generator.to_tenji_char('HU')
    assert_equal <<~TENJI.chomp, @tenji_generator.show_tenji(tenji)
      oo
      --
      oo
    TENJI
  end

  def test_he
    tenji = @tenji_generator.to_tenji_char('HE')
    assert_equal <<~TENJI.chomp, @tenji_generator.show_tenji(tenji)
      oo
      o-
      oo
    TENJI
  end

  def test_ho
    tenji = @tenji_generator.to_tenji_char('HO')
    assert_equal <<~TENJI.chomp, @tenji_generator.show_tenji(tenji)
      -o
      o-
      oo
    TENJI
  end

  def test_ma
    tenji = @tenji_generator.to_tenji_char('MA')
    assert_equal <<~TENJI.chomp, @tenji_generator.show_tenji(tenji)
      o-
      -o
      oo
    TENJI
  end

  def test_mi
    tenji = @tenji_generator.to_tenji_char('MI')
    assert_equal <<~TENJI.chomp, @tenji_generator.show_tenji(tenji)
      o-
      oo
      oo
    TENJI
  end

  def test_mu
    tenji = @tenji_generator.to_tenji_char('MU')
    assert_equal <<~TENJI.chomp, @tenji_generator.show_tenji(tenji)
      oo
      -o
      oo
    TENJI
  end

  def test_me
    tenji = @tenji_generator.to_tenji_char('ME')
    assert_equal <<~TENJI.chomp, @tenji_generator.show_tenji(tenji)
      oo
      oo
      oo
    TENJI
  end

  def test_mo
    tenji = @tenji_generator.to_tenji_char('MO')
    assert_equal <<~TENJI.chomp, @tenji_generator.show_tenji(tenji)
      -o
      oo
      oo
    TENJI
  end

  def test_ra
    tenji = @tenji_generator.to_tenji_char('RA')
    assert_equal <<~TENJI.chomp, @tenji_generator.show_tenji(tenji)
      o-
      -o
      --
    TENJI
  end

  def test_ri
    tenji = @tenji_generator.to_tenji_char('RI')
    assert_equal <<~TENJI.chomp, @tenji_generator.show_tenji(tenji)
      o-
      oo
      --
    TENJI
  end

  def test_ru
    tenji = @tenji_generator.to_tenji_char('RU')
    assert_equal <<~TENJI.chomp, @tenji_generator.show_tenji(tenji)
      oo
      -o
      --
    TENJI
  end

  def test_re
    tenji = @tenji_generator.to_tenji_char('RE')
    assert_equal <<~TENJI.chomp, @tenji_generator.show_tenji(tenji)
      oo
      oo
      --
    TENJI
  end

  def test_ro
    tenji = @tenji_generator.to_tenji_char('RO')
    assert_equal <<~TENJI.chomp, @tenji_generator.show_tenji(tenji)
      -o
      oo
      --
    TENJI
  end

  def test_ya
    tenji = @tenji_generator.to_tenji_char('YA')
    assert_equal <<~TENJI.chomp, @tenji_generator.show_tenji(tenji)
      -o
      --
      o-
    TENJI
  end

  def test_yu
    tenji = @tenji_generator.to_tenji_char('YU')
    assert_equal <<~TENJI.chomp, @tenji_generator.show_tenji(tenji)
      -o
      --
      oo
    TENJI
  end

  def test_yo
    tenji = @tenji_generator.to_tenji_char('YO')
    assert_equal <<~TENJI.chomp, @tenji_generator.show_tenji(tenji)
      -o
      -o
      o-
    TENJI
  end

  def test_wa
    tenji = @tenji_generator.to_tenji_char('WA')
    assert_equal <<~TENJI.chomp, @tenji_generator.show_tenji(tenji)
      --
      --
      o-
    TENJI
  end
end
