require 'minitest/autorun'
require_relative '../lib/tenji_array_generator'

class TenjiStringGeneratorTest < Minitest::Test

  def setup
    @tenji_string_generator = TenjiStringGenerator.new
  end

  def test_single_tenji_array
    input = [
              ['o', '-'],
              ['o', '-'],
              ['o', 'o']
            ]
    tenji = @tenji_string_generator.to_tenji_string(input)
    assert_equal <<~TENJI.chomp, tenji
      o-
      o-
      oo
    TENJI
  end

  def test_multi_tenji_array
    input = [
              [
                ['o', '-'],
                ['-', '-'],
                ['-', 'o']
              ], 
              [
                ['o', '-'],
                ['-', 'o'],
                ['-', '-']
              ], 
              [
                ['o', 'o'],
                ['-', 'o'],
                ['-', 'o']
              ]
            ]
    tenji = @tenji_string_generator.to_tenji_string(input)
    assert_equal <<~TENJI.chomp, tenji
      o- o- oo
      -- -o -o
      -o -- -o
    TENJI
  end
end
