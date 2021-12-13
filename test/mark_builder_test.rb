# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../lib/tenji'
require_relative '../lib/mark_builder'

class MarkBuilderTest < Minitest::Test
  def setup
    @builder = MarkBuilder.new
  end

  def test_build_tenjis_A_HI_RU
    tenjis = build_tenjis('A HI RU')

    assert_equal <<~TENJI.chomp, @builder.builds(tenjis)
      o- o- oo
      -- o- -o
      -- oo --
    TENJI
  end

  private

  def build_tenjis(string)
    chars = string.split(MarkBuilder::DELMITER)
    chars.map { |char| Tenji.new(char) }
  end
end
