require "minitest/autorun"
require_relative "../lib/tenji"

class TenjiTest < Minitest::Test
  def test_a
    tenji = Tenji.new("A").to_h
    assert_equal(
      {
        1 => "o", 4 => "-",
        2 => "-", 5 => "-",
        3 => "-", 6 => "-",
      }, tenji
    )
  end

  def test_i
    tenji = Tenji.new("I").to_h
    assert_equal(
      {
        1 => "o", 4 => "-",
        2 => "o", 5 => "-",
        3 => "-", 6 => "-",
      }, tenji
    )
  end

  def test_u
    tenji = Tenji.new("U").to_h
    assert_equal(
      {
        1 => "o", 4 => "o",
        2 => "-", 5 => "-",
        3 => "-", 6 => "-",
      }, tenji
    )
  end

  def test_e
    tenji = Tenji.new("E").to_h
    assert_equal(
      {
        1 => "o", 4 => "o",
        2 => "o", 5 => "-",
        3 => "-", 6 => "-",
      }, tenji
    )
  end

  def test_o
    tenji = Tenji.new("O").to_h
    assert_equal(
      {
        1 => "-", 4 => "o",
        2 => "o", 5 => "-",
        3 => "-", 6 => "-",
      }, tenji
    )
  end

  def test_ka
    tenji = Tenji.new("KA").to_h
    assert_equal(
      {
        1 => "o", 4 => "-",
        2 => "-", 5 => "-",
        3 => "-", 6 => "o",
      }, tenji
    )
  end

  def test_si
    tenji = Tenji.new("SI").to_h
    assert_equal(
      {
        1 => "o", 4 => "-",
        2 => "o", 5 => "o",
        3 => "-", 6 => "o",
      }, tenji
    )
  end

  def test_tu
    tenji = Tenji.new("TU").to_h
    assert_equal(
      {
        1 => "o", 4 => "o",
        2 => "-", 5 => "o",
        3 => "o", 6 => "-",
      }, tenji
    )
  end

  def test_ne
    tenji = Tenji.new("NE").to_h
    assert_equal(
      {
        1 => "o", 4 => "o",
        2 => "o", 5 => "-",
        3 => "o", 6 => "-",
      }, tenji
    )
  end

  def test_ho
    tenji = Tenji.new("HO").to_h
    assert_equal(
      {
        1 => "-", 4 => "o",
        2 => "o", 5 => "-",
        3 => "o", 6 => "o",
      }, tenji
    )
  end

  def test_ma
    tenji = Tenji.new("MA").to_h
    assert_equal(
      {
        1 => "o", 4 => "-",
        2 => "-", 5 => "o",
        3 => "o", 6 => "o",
      }, tenji
    )
  end

  def test_ro
    tenji = Tenji.new("RO").to_h
    assert_equal(
      {
        1 => "-", 4 => "o",
        2 => "o", 5 => "o",
        3 => "-", 6 => "-",
      }, tenji
    )
  end

  def test_ya
    tenji = Tenji.new("YA").to_h
    assert_equal(
      {
        1 => "-", 4 => "o",
        2 => "-", 5 => "-",
        3 => "o", 6 => "-",
      }, tenji
    )
  end

  def test_yu
    tenji = Tenji.new("YU").to_h
    assert_equal(
      {
        1 => "-", 4 => "o",
        2 => "-", 5 => "-",
        3 => "o", 6 => "o",
      }, tenji
    )
  end

  def test_yo
    tenji = Tenji.new("YO").to_h
    assert_equal(
      {
        1 => "-", 4 => "o",
        2 => "-", 5 => "o",
        3 => "o", 6 => "-",
      }, tenji
    )
  end

  def test_wa
    tenji = Tenji.new("WA").to_h
    assert_equal(
      {
        1 => "-", 4 => "-",
        2 => "-", 5 => "-",
        3 => "o", 6 => "-",
      }, tenji
    )
  end

  def test_n
    tenji = Tenji.new("N").to_h
    assert_equal(
      {
        1 => "-", 4 => "-",
        2 => "-", 5 => "o",
        3 => "o", 6 => "o",
      }, tenji
    )
  end
end
