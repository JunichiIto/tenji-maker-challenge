# frozen_string_literal: true

require 'matrix'

# 行列(数値)を出力用行列(文字列)に変換するモジュール
module Converter
  CONV_TABLE = {
    -1 => ' ',
    1 => 'o',
    0 => '-'
  }.transform_values(&:freeze)

  class << self
    # 行列の配列を点字形式に変換した文字列を返す
    #
    # @param [Array<Matrix>] matrices 点字行列の配列
    # @return [String] 点字形式の文字列
    def to_tenji(matrices)
      Matrix.hstack(*matrices).to_a.map { |row| row.map { |n| CONV_TABLE[n] }.join }.join("\n")
    end
  end
end
