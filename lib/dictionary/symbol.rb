# frozen_string_literal: true

require 'matrix'
require_relative '../tenji_builder'

# 辞書
module Dictionary
  # 点字で表せない記号
  module Symbol
    class << self
      # 与えられた文字列(記号)に対応する行列を返す
      #
      # @param [String] word 文字列(記号)
      # @return [Matrix] 対応する行列
      def to_m(word)
        symbols[word]
      end

      # 記号と行列の対応表を返す
      #
      # @return [Hash] 記号と行列の対応表
      def symbols
        @symbols ||= {
          ' ' => Matrix[[-1], [-1], [-1]]
        }
      end
    end
  end
end
