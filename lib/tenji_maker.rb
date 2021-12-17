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
    matrices = text.split(SEPARATOR).map { |s| Dictionary::Tenji.to_m(s) }
    matrices = matrices.zip([Dictionary::Symbol.to_m(SEPARATOR)] * matrices.size).flatten
    matrices.pop

    Converter.to_tenji(matrices)
  end
end
