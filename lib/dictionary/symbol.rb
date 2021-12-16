# frozen_string_literal: true

require 'matrix'
require_relative '../tenji_builder'

# 辞書
module Dictionary
  # 点字で表せない記号
  module Symbol
    SPACE = ' '

    class << self
      def space
        Matrix[[SPACE], [SPACE], [SPACE]]
      end
    end
  end
end
