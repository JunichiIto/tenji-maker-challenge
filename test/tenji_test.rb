# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../lib/tenji'

class TenjiTest < Minitest::Test
  def test_squares_母音のみ_A
    tenji = Tenji.new('A')
    assert_equal [1], tenji.squares
  end

  def test_squares_母音のみ_O
    tenji = Tenji.new('O')
    assert_equal [2, 4], tenji.squares
  end

  def test_squares_母音と子音_MI
    tenji = Tenji.new('MI')
    assert_equal [1, 2, 3, 5, 6], tenji.squares
  end

  def test_squares_母音と子音_HI
    tenji = Tenji.new('HI')
    assert_equal [1, 2, 3, 6], tenji.squares
  end

  def test_squares_特殊文字_WA
    tenji = Tenji.new('WA')
    assert_equal tenji.squares, [3]
  end

  def test_squares_特殊文字_N
    tenji = Tenji.new('N')
    assert_equal tenji.squares, [3, 5, 6]
  end
end
