require 'minitest/autorun'
require_relative '../lib/tenji_builder'

class TenjiBuilderTest < Minitest::Test
  # え
  def test_create_1_2_4
    tenji_matrix = TenjiBuilder.create(1, 2, 4)
    assert_equal(
      Matrix[
        [1, 1],
        [1, 0],
        [0, 0]
      ],
      tenji_matrix
    )
  end

  # ん
  def test_create_3_5_6
    tenji_matrix = TenjiBuilder.create(3, 5, 6)
    assert_equal(
      Matrix[
        [0, 0],
        [0, 1],
        [1, 1]
      ],
      tenji_matrix
    )
  end

  def test_create_non
    tenji_matrix = TenjiBuilder.create
    assert_equal(
      Matrix[
        [0, 0],
        [0, 0],
        [0, 0]
      ],
      tenji_matrix
    )
  end
end
