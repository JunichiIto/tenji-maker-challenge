require 'minitest/autorun'
require_relative '../../lib/dictionary/symbol'

class Dictionary::SymbolTest < Minitest::Test
  def test_space
    assert_equal(
      Matrix[
        [' '],
        [' '],
        [' ']
      ],
      Dictionary::Symbol.space
    )
  end
end
