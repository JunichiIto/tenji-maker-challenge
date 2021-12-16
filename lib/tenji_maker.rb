# frozen_string_literal: true

require_relative './converter'
require_relative './dictionary/symbol'
require_relative './dictionary/tenji'
require_relative './tenji_builder'

# 点字メーカークラス
#
# @see https://github.com/JunichiIto/tenji-maker-challenge
class TenjiMaker
  SEPARATOR = ' '

  # 与えられた文字列を点字形式に変換した文字列を返す
  #
  # @param [String] text 文字列(空白区切りのローマ字)
  def to_tenji(text)
    # ローマ字を点字形式Matrixへ変換
    matrices = text.split(SEPARATOR).map { |s| Dictionary::Tenji.to_m(s) }
    # 空白を意味するMatrixとの交互に並べた配列を生成
    matrices = matrices.zip([Dictionary::Symbol.space] * matrices.size).flatten
    # 末尾の余分な空白を意味するMatrixを除去
    matrices.pop

    Converter.to_tenji(matrices)
  end
end
