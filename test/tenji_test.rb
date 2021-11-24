# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../lib/tenji'

class TenjiTest < Minitest::Test
  def test_squares_母音のみ
    tenji = Tenji.new('A')
    assert_equal [1], tenji.squares
  end

  def test_squares_母音と子音
    tenji = Tenji.new('MI')
    assert_equal [1, 2, 3, 5, 6], tenji.squares
  end

  def test_squares_特殊文字_N
    tenji = Tenji.new('N')
    assert_equal tenji.squares, [3, 5, 6]
  end
end
