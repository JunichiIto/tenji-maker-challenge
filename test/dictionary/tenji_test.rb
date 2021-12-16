require 'minitest/autorun'
require_relative '../../lib/tenji_builder'
require_relative '../../lib/dictionary/tenji'

class Dictionary::TenjiTest < Minitest::Test
  # 母音
  def test_vowel
    tenji_matrix = Dictionary::Tenji.to_m('A')
    assert_equal(
      TenjiBuilder.create(1),
      tenji_matrix
    )
  end

  # 子音 (行 + 母音)
  def test_consonant
    tenji_matrix = Dictionary::Tenji.to_m('KI')
    assert_equal(
      TenjiBuilder.create(1, 2, 6),
      tenji_matrix
    )
  end

  # やゆよ、わを (行 + 一番下に移動させた母音)
  def test_consonant_move
    tenji_matrix = Dictionary::Tenji.to_m('YA')
    assert_equal(
      TenjiBuilder.create(3, 4),
      tenji_matrix
    )
  end

  # ん
  def test_n
    tenji_matrix = Dictionary::Tenji.to_m('N')
    assert_equal(
      TenjiBuilder.create(3, 5, 6),
      tenji_matrix,
    )
  end

  def test_move_to_the_bottom_moved
    tenji_matrix = Dictionary::Tenji.move_to_the_bottom(TenjiBuilder.create(2, 4))
    assert_equal(
      TenjiBuilder.create(3, 5),
      tenji_matrix
    )
  end

  def test_move_to_the_bottom_not_moved
    tenji_matrix = Dictionary::Tenji.move_to_the_bottom(TenjiBuilder.create(1, 2, 3))
    assert_equal(
      TenjiBuilder.create(1, 2, 3),
      tenji_matrix
    )
  end
end
