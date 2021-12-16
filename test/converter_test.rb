require 'minitest/autorun'
require_relative '../lib/converter'
require_relative '../lib/tenji_builder'

class ConverterTest < Minitest::Test
  def test_to_tenji
    matrices = [
      TenjiBuilder.create(1, 2, 3, 4, 5),
      Matrix[[' '], [' '], [' ']],
      TenjiBuilder.create(1, 4, 5, 6),
      Matrix[[' '], [' '], [' ']],
      TenjiBuilder.create(2, 3, 4, 5)
    ]
    assert_equal <<~TENJI.chomp, Converter.to_tenji(matrices)
      oo oo -o
      oo -o oo
      o- -o o-
    TENJI
  end
end
