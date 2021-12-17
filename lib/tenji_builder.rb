# frozen_string_literal: true

require 'matrix'

# 点字生成モジュール
module TenjiBuilder
  @base = {
    0 => Matrix[[0, 0], [0, 0], [0, 0]], # 点なし
    1 => Matrix[[1, 0], [0, 0], [0, 0]], # 点番号1
    2 => Matrix[[0, 0], [1, 0], [0, 0]], # 点番号2
    3 => Matrix[[0, 0], [0, 0], [1, 0]], # 点番号3
    4 => Matrix[[0, 1], [0, 0], [0, 0]], # 点番号4
    5 => Matrix[[0, 0], [0, 1], [0, 0]], # 点番号5
    6 => Matrix[[0, 0], [0, 0], [0, 1]]  # 点番号6
  }

  class << self
    # 点字形式の行列を作成する
    #
    # @param [Array] numbers 点番号一覧
    # @return [Matrix] 指定された点番号を表す行列
    def create(*numbers)
      numbers.map { |n| @base[n] }.inject(@base[0]) { |result, item| result + item }
    end
  end
end
