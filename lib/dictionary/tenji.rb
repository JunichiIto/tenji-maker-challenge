# frozen_string_literal: true

require 'matrix'
require_relative '../tenji_builder'

# 辞書
module Dictionary
  # 点字
  module Tenji
    VOWELS = {
      'A' => TenjiBuilder.create(1),
      'I' => TenjiBuilder.create(1, 2),
      'U' => TenjiBuilder.create(1, 4),
      'E' => TenjiBuilder.create(1, 2, 4),
      'O' => TenjiBuilder.create(2, 4)
    }.transform_values(&:freeze)

    COLUMNS = {
      'K' => TenjiBuilder.create(6),
      'S' => TenjiBuilder.create(5, 6),
      'T' => TenjiBuilder.create(3, 5),
      'N' => TenjiBuilder.create(3),
      'H' => TenjiBuilder.create(3, 6),
      'M' => TenjiBuilder.create(3, 5, 6),
      'Y' => TenjiBuilder.create(4),
      'R' => TenjiBuilder.create(5),
      'W' => TenjiBuilder.create,
      'NN' => TenjiBuilder.create(3, 5, 6)
    }.transform_values(&:freeze)

    class << self
      # 与えられた文字列(ローマ字)を点字形式の行列に変換して返す
      #
      # @param [String] word 文字列(ローマ字)
      # @return [Matrix] 点字形式の行列
      def to_m(word)
        case word
        when /\A[AIUEO]{1}\z/
          # 母音
          VOWELS[word[0]]
        when /\A[KSTNHMR]{1}[AIUEO]{1}\z/
          # 子音 (行 + 母音)
          COLUMNS[word[0]] + VOWELS[word[1]]
        when /\AY[AUO]{1}\z/, /\AW[AO]{1}\z/
          # やゆよ、わを (行 + 一番下に移動させた母音)
          COLUMNS[word[0]] + move_to_the_bottom(VOWELS[word[1]])
        when /\AN{1}\z/
          # ん
          COLUMNS['NN']
        end
      end

      # 与えられた行列を一番下までずらした行列を返す
      #
      # @param [Matrix] matrix 行列
      # @return [Matrix] 一番下までずらした行列
      def move_to_the_bottom(matrix)
        arr = matrix.to_a
        arr.unshift(arr.pop) while arr[-1].all?(&:zero?)

        Matrix[*arr]
      end
    end
  end
end
