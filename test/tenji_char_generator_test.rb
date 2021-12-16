require 'minitest/autorun'
require_relative '../lib/tenji_char_generator'

class TenjiCharGeneratorTest < Minitest::Test
  def setup
    @tenji_generator = TenjiCharGenerator.new
  end

  def test_a
    tenji = @tenji_generator.to_tenji_char_array('A')
    expected = [
                ['o', '-'],
                ['-', '-'],
                ['-', '-']
              ]
    assert_equal expected, tenji
  end

  def test_i
    tenji = @tenji_generator.to_tenji_char_array('I')
    expected = [
                ['o', '-'],
                ['o', '-'],
                ['-', '-']
              ]
    assert_equal expected, tenji
  end

  def test_u
    tenji = @tenji_generator.to_tenji_char_array('U')
    expected = [
                ['o', 'o'],
                ['-', '-'],
                ['-', '-']
              ]
    assert_equal expected, tenji
  end

  def test_e
    tenji = @tenji_generator.to_tenji_char_array('E')
    expected = [
                ['o', 'o'],
                ['o', '-'],
                ['-', '-']
              ]
    assert_equal expected, tenji
  end

  def test_o
    tenji = @tenji_generator.to_tenji_char_array('O')
    expected = [
                ['-', 'o'],
                ['o', '-'],
                ['-', '-']
              ]
    assert_equal expected, tenji
  end

  def test_ka
    tenji = @tenji_generator.to_tenji_char_array('KA')
    expected = [
                ['o', '-'],
                ['-', '-'],
                ['-', 'o']
              ]
    assert_equal expected, tenji
  end

  def test_ki
    tenji = @tenji_generator.to_tenji_char_array('KI')
    expected = [
                ['o', '-'],
                ['o', '-'],
                ['-', 'o']
              ]
    assert_equal expected, tenji
  end

  def test_ku
    tenji = @tenji_generator.to_tenji_char_array('KU')
    expected = [
                ['o', 'o'],
                ['-', '-'],
                ['-', 'o']
              ]
    assert_equal expected, tenji
  end

  def test_ke
    tenji = @tenji_generator.to_tenji_char_array('KE')
    expected = [
                ['o', 'o'],
                ['o', '-'],
                ['-', 'o']
              ]
    assert_equal expected, tenji
  end

  def test_ko
    tenji = @tenji_generator.to_tenji_char_array('KO')
    expected = [
                ['-', 'o'],
                ['o', '-'],
                ['-', 'o']
              ]
    assert_equal expected, tenji
  end

  def test_sa
    tenji = @tenji_generator.to_tenji_char_array('SA')
    expected = [
                ['o', '-'],
                ['-', 'o'],
                ['-', 'o']
              ]
    assert_equal expected, tenji
  end

  def test_si
    tenji = @tenji_generator.to_tenji_char_array('SI')
    expected = [
                ['o', '-'],
                ['o', 'o'],
                ['-', 'o']
              ]
    assert_equal expected, tenji
  end

  def test_su
    tenji = @tenji_generator.to_tenji_char_array('SU')
    expected = [
                ['o', 'o'],
                ['-', 'o'],
                ['-', 'o']
              ]
    assert_equal expected, tenji
  end

  def test_se
    tenji = @tenji_generator.to_tenji_char_array('SE')
    expected = [
                ['o', 'o'],
                ['o', 'o'],
                ['-', 'o']
              ]
    assert_equal expected, tenji
  end

  def test_so
    tenji = @tenji_generator.to_tenji_char_array('SO')
    expected = [
                ['-', 'o'],
                ['o', 'o'],
                ['-', 'o']
              ]
    assert_equal expected, tenji
  end

  def test_ta
    tenji = @tenji_generator.to_tenji_char_array('TA')
    expected = [
                ['o', '-'],
                ['-', 'o'],
                ['o', '-']
              ]
    assert_equal expected, tenji
  end

  def test_ti
    tenji = @tenji_generator.to_tenji_char_array('TI')
    expected = [
                ['o', '-'],
                ['o', 'o'],
                ['o', '-']
              ]
    assert_equal expected, tenji
  end

  def test_tu
    tenji = @tenji_generator.to_tenji_char_array('TU')
    expected = [
                ['o', 'o'],
                ['-', 'o'],
                ['o', '-']
              ]
    assert_equal expected, tenji
  end

  def test_te
    tenji = @tenji_generator.to_tenji_char_array('TE')
    expected = [
                ['o', 'o'],
                ['o', 'o'],
                ['o', '-']
              ]
    assert_equal expected, tenji
  end

  def test_to
    tenji = @tenji_generator.to_tenji_char_array('TO')
    expected = [
                ['-', 'o'],
                ['o', 'o'],
                ['o', '-']
              ]
    assert_equal expected, tenji
  end

  def test_na
    tenji = @tenji_generator.to_tenji_char_array('NA')
    expected = [
                ['o', '-'],
                ['-', '-'],
                ['o', '-']
              ]
    assert_equal expected, tenji
  end

  def test_ni
    tenji = @tenji_generator.to_tenji_char_array('NI')
    expected = [
                ['o', '-'],
                ['o', '-'],
                ['o', '-']
              ]
    assert_equal expected, tenji
  end

  def test_nu
    tenji = @tenji_generator.to_tenji_char_array('NU')
    expected = [
                ['o', 'o'],
                ['-', '-'],
                ['o', '-']
              ]
    assert_equal expected, tenji
  end

  def test_ne
    tenji = @tenji_generator.to_tenji_char_array('NE')
    expected = [
                ['o', 'o'],
                ['o', '-'],
                ['o', '-']
              ]
    assert_equal expected, tenji
  end

  def test_no
    tenji = @tenji_generator.to_tenji_char_array('NO')
    expected = [
                ['-', 'o'],
                ['o', '-'],
                ['o', '-']
              ]
    assert_equal expected, tenji
  end

  def test_ha
    tenji = @tenji_generator.to_tenji_char_array('HA')
    expected = [
                ['o', '-'],
                ['-', '-'],
                ['o', 'o']
              ]
    assert_equal expected, tenji
  end

  def test_hi
    tenji = @tenji_generator.to_tenji_char_array('HI')
    expected = [
                ['o', '-'],
                ['o', '-'],
                ['o', 'o']
              ]
    assert_equal expected, tenji
  end

  def test_hu
    tenji = @tenji_generator.to_tenji_char_array('HU')
    expected = [
                ['o', 'o'],
                ['-', '-'],
                ['o', 'o']
              ]
    assert_equal expected, tenji
  end

  def test_he
    tenji = @tenji_generator.to_tenji_char_array('HE')
    expected = [
                ['o', 'o'],
                ['o', '-'],
                ['o', 'o']
              ]
    assert_equal expected, tenji
  end

  def test_ho
    tenji = @tenji_generator.to_tenji_char_array('HO')
    expected = [
                ['-', 'o'],
                ['o', '-'],
                ['o', 'o'],
              ]
    assert_equal expected, tenji
  end

  def test_ma
    tenji = @tenji_generator.to_tenji_char_array('MA')
    expected = [
                ['o', '-'],
                ['-', 'o'],
                ['o', 'o'],
              ]
    assert_equal expected, tenji
  end

  def test_mi
    tenji = @tenji_generator.to_tenji_char_array('MI')
    expected = [
                ['o', '-'],
                ['o', 'o'],
                ['o', 'o']
              ]
    assert_equal expected, tenji
  end

  def test_mu
    tenji = @tenji_generator.to_tenji_char_array('MU')
    expected = [
                ['o', 'o'],
                ['-', 'o'],
                ['o', 'o']
              ]
    assert_equal expected, tenji
  end

  def test_me
    tenji = @tenji_generator.to_tenji_char_array('ME')
    expected = [
                ['o', 'o'],
                ['o', 'o'],
                ['o', 'o']
              ]
    assert_equal expected, tenji
  end

  def test_mo
    tenji = @tenji_generator.to_tenji_char_array('MO')
    expected = [
                ['-', 'o'],
                ['o', 'o'],
                ['o', 'o']
              ]
    assert_equal expected, tenji
  end

  def test_ra
    tenji = @tenji_generator.to_tenji_char_array('RA')
    expected = [
                ['o', '-'],
                ['-', 'o'],
                ['-', '-']
              ]
    assert_equal expected, tenji
  end

  def test_ri
    tenji = @tenji_generator.to_tenji_char_array('RI')
    expected = [
                ['o', '-'],
                ['o', 'o'],
                ['-', '-']
              ]
    assert_equal expected, tenji
  end

  def test_ru
    tenji = @tenji_generator.to_tenji_char_array('RU')
    expected = [
                ['o', 'o'],
                ['-', 'o'],
                ['-', '-']
              ]
    assert_equal expected, tenji
  end

  def test_re
    tenji = @tenji_generator.to_tenji_char_array('RE')
    expected = [
                ['o', 'o'],
                ['o', 'o'],
                ['-', '-']
              ]
    assert_equal expected, tenji
  end

  def test_ro
    tenji = @tenji_generator.to_tenji_char_array('RO')
    expected = [
                ['-', 'o'],
                ['o', 'o'],
                ['-', '-']
              ]
    assert_equal expected, tenji
  end

  def test_ya
    tenji = @tenji_generator.to_tenji_char_array('YA')
    expected = [
                ['-', 'o'],
                ['-', '-'],
                ['o', '-']
              ]
    assert_equal expected, tenji
  end

  def test_yu
    tenji = @tenji_generator.to_tenji_char_array('YU')
    expected = [
                ['-', 'o'],
                ['-', '-'],
                ['o', 'o']
              ]
    assert_equal expected, tenji
  end

  def test_yo
    tenji = @tenji_generator.to_tenji_char_array('YO')
    expected = [
                ['-', 'o'],
                ['-', 'o'],
                ['o', '-']
              ]
    assert_equal expected, tenji
  end

  def test_wa
    tenji = @tenji_generator.to_tenji_char_array('WA')
    expected = [
                ['-', '-'],
                ['-', '-'],
                ['o', '-']
              ]
    assert_equal expected, tenji
  end

  def test_n
    tenji = @tenji_generator.to_tenji_char_array('N')
    expected = [
                ['-', '-'],
                ['-', 'o'],
                ['o', 'o'],
              ]
    assert_equal expected, tenji
  end
end
