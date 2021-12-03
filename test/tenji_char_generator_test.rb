require 'minitest/autorun'
require_relative '../lib/tenji_char_generator'

class TenjiCharGeneratorTest < Minitest::Test
  def setup
    @tenji_generator = TenjiCharGenerator.new
  end

  def test_a
    tenji = @tenji_generator.to_tenji_char_array('A')
    assert_equal <<~TENJI.chomp, @tenji_generator.show_tenji(tenji)
      o-
      --
      --
    TENJI
  end

  def test_i
    tenji = @tenji_generator.to_tenji_char_array('I')
    assert_equal <<~TENJI.chomp, @tenji_generator.show_tenji(tenji)
      o-
      o-
      --
    TENJI
  end

  def test_u
    tenji = @tenji_generator.to_tenji_char_array('U')
    assert_equal <<~TENJI.chomp, @tenji_generator.show_tenji(tenji)
      oo
      --
      --
    TENJI
  end

  def test_e
    tenji = @tenji_generator.to_tenji_char_array('E')
    assert_equal <<~TENJI.chomp, @tenji_generator.show_tenji(tenji)
      oo
      o-
      --
    TENJI
  end

  def test_o
    tenji = @tenji_generator.to_tenji_char_array('O')
    assert_equal <<~TENJI.chomp, @tenji_generator.show_tenji(tenji)
      -o
      o-
      --
    TENJI
  end

  def test_ka
    tenji = @tenji_generator.to_tenji_char_array('KA')
    assert_equal <<~TENJI.chomp, @tenji_generator.show_tenji(tenji)
      o-
      --
      -o
    TENJI
  end

  def test_ki
    tenji = @tenji_generator.to_tenji_char_array('KI')
    assert_equal <<~TENJI.chomp, @tenji_generator.show_tenji(tenji)
      o-
      o-
      -o
    TENJI
  end

  def test_ku
    tenji = @tenji_generator.to_tenji_char_array('KU')
    assert_equal <<~TENJI.chomp, @tenji_generator.show_tenji(tenji)
      oo
      --
      -o
    TENJI
  end

  def test_ke
    tenji = @tenji_generator.to_tenji_char_array('KE')
    assert_equal <<~TENJI.chomp, @tenji_generator.show_tenji(tenji)
      oo
      o-
      -o
    TENJI
  end

  def test_ko
    tenji = @tenji_generator.to_tenji_char_array('KO')
    assert_equal <<~TENJI.chomp, @tenji_generator.show_tenji(tenji)
      -o
      o-
      -o
    TENJI
  end

  def test_sa
    tenji = @tenji_generator.to_tenji_char_array('SA')
    assert_equal <<~TENJI.chomp, @tenji_generator.show_tenji(tenji)
      o-
      -o
      -o
    TENJI
  end

  def test_si
    tenji = @tenji_generator.to_tenji_char_array('SI')
    assert_equal <<~TENJI.chomp, @tenji_generator.show_tenji(tenji)
      o-
      oo
      -o
    TENJI
  end

  def test_su
    tenji = @tenji_generator.to_tenji_char_array('SU')
    assert_equal <<~TENJI.chomp, @tenji_generator.show_tenji(tenji)
      oo
      -o
      -o
    TENJI
  end

  def test_se
    tenji = @tenji_generator.to_tenji_char_array('SE')
    assert_equal <<~TENJI.chomp, @tenji_generator.show_tenji(tenji)
      oo
      oo
      -o
    TENJI
  end

  def test_so
    tenji = @tenji_generator.to_tenji_char_array('SO')
    assert_equal <<~TENJI.chomp, @tenji_generator.show_tenji(tenji)
      -o
      oo
      -o
    TENJI
  end

  def test_ta
    tenji = @tenji_generator.to_tenji_char_array('TA')
    assert_equal <<~TENJI.chomp, @tenji_generator.show_tenji(tenji)
      o-
      -o
      o-
    TENJI
  end

  def test_ti
    tenji = @tenji_generator.to_tenji_char_array('TI')
    assert_equal <<~TENJI.chomp, @tenji_generator.show_tenji(tenji)
      o-
      oo
      o-
    TENJI
  end

  def test_tu
    tenji = @tenji_generator.to_tenji_char_array('TU')
    assert_equal <<~TENJI.chomp, @tenji_generator.show_tenji(tenji)
      oo
      -o
      o-
    TENJI
  end

  def test_te
    tenji = @tenji_generator.to_tenji_char_array('TE')
    assert_equal <<~TENJI.chomp, @tenji_generator.show_tenji(tenji)
      oo
      oo
      o-
    TENJI
  end

  def test_to
    tenji = @tenji_generator.to_tenji_char_array('TO')
    assert_equal <<~TENJI.chomp, @tenji_generator.show_tenji(tenji)
      -o
      oo
      o-
    TENJI
  end

  def test_na
    tenji = @tenji_generator.to_tenji_char_array('NA')
    assert_equal <<~TENJI.chomp, @tenji_generator.show_tenji(tenji)
      o-
      --
      o-
    TENJI
  end

  def test_ni
    tenji = @tenji_generator.to_tenji_char_array('NI')
    assert_equal <<~TENJI.chomp, @tenji_generator.show_tenji(tenji)
      o-
      o-
      o-
    TENJI
  end

  def test_nu
    tenji = @tenji_generator.to_tenji_char_array('NU')
    assert_equal <<~TENJI.chomp, @tenji_generator.show_tenji(tenji)
      oo
      --
      o-
    TENJI
  end

  def test_ne
    tenji = @tenji_generator.to_tenji_char_array('NE')
    assert_equal <<~TENJI.chomp, @tenji_generator.show_tenji(tenji)
      oo
      o-
      o-
    TENJI
  end

  def test_no
    tenji = @tenji_generator.to_tenji_char_array('NO')
    assert_equal <<~TENJI.chomp, @tenji_generator.show_tenji(tenji)
      -o
      o-
      o-
    TENJI
  end

  def test_ha
    tenji = @tenji_generator.to_tenji_char_array('HA')
    assert_equal <<~TENJI.chomp, @tenji_generator.show_tenji(tenji)
      o-
      --
      oo
    TENJI
  end

  def test_hi
    tenji = @tenji_generator.to_tenji_char_array('HI')
    assert_equal <<~TENJI.chomp, @tenji_generator.show_tenji(tenji)
      o-
      o-
      oo
    TENJI
  end

  def test_hu
    tenji = @tenji_generator.to_tenji_char_array('HU')
    assert_equal <<~TENJI.chomp, @tenji_generator.show_tenji(tenji)
      oo
      --
      oo
    TENJI
  end

  def test_he
    tenji = @tenji_generator.to_tenji_char_array('HE')
    assert_equal <<~TENJI.chomp, @tenji_generator.show_tenji(tenji)
      oo
      o-
      oo
    TENJI
  end

  def test_ho
    tenji = @tenji_generator.to_tenji_char_array('HO')
    assert_equal <<~TENJI.chomp, @tenji_generator.show_tenji(tenji)
      -o
      o-
      oo
    TENJI
  end

  def test_ma
    tenji = @tenji_generator.to_tenji_char_array('MA')
    assert_equal <<~TENJI.chomp, @tenji_generator.show_tenji(tenji)
      o-
      -o
      oo
    TENJI
  end

  def test_mi
    tenji = @tenji_generator.to_tenji_char_array('MI')
    assert_equal <<~TENJI.chomp, @tenji_generator.show_tenji(tenji)
      o-
      oo
      oo
    TENJI
  end

  def test_mu
    tenji = @tenji_generator.to_tenji_char_array('MU')
    assert_equal <<~TENJI.chomp, @tenji_generator.show_tenji(tenji)
      oo
      -o
      oo
    TENJI
  end

  def test_me
    tenji = @tenji_generator.to_tenji_char_array('ME')
    assert_equal <<~TENJI.chomp, @tenji_generator.show_tenji(tenji)
      oo
      oo
      oo
    TENJI
  end

  def test_mo
    tenji = @tenji_generator.to_tenji_char_array('MO')
    assert_equal <<~TENJI.chomp, @tenji_generator.show_tenji(tenji)
      -o
      oo
      oo
    TENJI
  end

  def test_ra
    tenji = @tenji_generator.to_tenji_char_array('RA')
    assert_equal <<~TENJI.chomp, @tenji_generator.show_tenji(tenji)
      o-
      -o
      --
    TENJI
  end

  def test_ri
    tenji = @tenji_generator.to_tenji_char_array('RI')
    assert_equal <<~TENJI.chomp, @tenji_generator.show_tenji(tenji)
      o-
      oo
      --
    TENJI
  end

  def test_ru
    tenji = @tenji_generator.to_tenji_char_array('RU')
    assert_equal <<~TENJI.chomp, @tenji_generator.show_tenji(tenji)
      oo
      -o
      --
    TENJI
  end

  def test_re
    tenji = @tenji_generator.to_tenji_char_array('RE')
    assert_equal <<~TENJI.chomp, @tenji_generator.show_tenji(tenji)
      oo
      oo
      --
    TENJI
  end

  def test_ro
    tenji = @tenji_generator.to_tenji_char_array('RO')
    assert_equal <<~TENJI.chomp, @tenji_generator.show_tenji(tenji)
      -o
      oo
      --
    TENJI
  end

  def test_ya
    tenji = @tenji_generator.to_tenji_char_array('YA')
    assert_equal <<~TENJI.chomp, @tenji_generator.show_tenji(tenji)
      -o
      --
      o-
    TENJI
  end

  def test_yu
    tenji = @tenji_generator.to_tenji_char_array('YU')
    assert_equal <<~TENJI.chomp, @tenji_generator.show_tenji(tenji)
      -o
      --
      oo
    TENJI
  end

  def test_yo
    tenji = @tenji_generator.to_tenji_char_array('YO')
    assert_equal <<~TENJI.chomp, @tenji_generator.show_tenji(tenji)
      -o
      -o
      o-
    TENJI
  end

  def test_wa
    tenji = @tenji_generator.to_tenji_char_array('WA')
    assert_equal <<~TENJI.chomp, @tenji_generator.show_tenji(tenji)
      --
      --
      o-
    TENJI
  end
end
