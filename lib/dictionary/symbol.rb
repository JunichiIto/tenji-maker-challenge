# frozen_string_literal: true

require 'matrix'
require_relative '../tenji_builder'

# 辞書
module Dictionary
  # 点字で表せない記号
  module Symbol
    SPACE = ' '

    class << self
      # 空白を表すMatrixを返す
      #
      # @return [Matrix] 空白を表すMatrix
      def space
        Matrix[[SPACE], [SPACE], [SPACE]]
      end
    end
  end
end
