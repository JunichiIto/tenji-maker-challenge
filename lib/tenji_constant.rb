# 点字生成用の定数モジュール
module TenjiConstant

  # 点字の列数
  TENJI_COLUMN_NUM = 2.freeze
  # 点字の列数
  TENJI_ROW_NUM = 3.freeze

  # 母音の点字の位置
  VOWEL_TENJI_POINT = {
    'A' => [1],
    'I' => [1, 2],
    'U' => [1, 4],
    'E' => [1, 2, 4],
    'O' => [2, 4]
  }.freeze

  # 子音の点字の位置
  CONSONANT_TENJI_POINT = {
    'K' => [6],
    'S' => [5, 6],
    'T' => [3, 5],
    'N' => [3],
    'H' => [3, 6],
    'M' => [3, 5, 6],
    'R' => [5]
  }.freeze

  # 例外として処理する点字の位置
  EXCEPTION_TENJI_POINT = {
    'YA' => [3, 4],
    'YU' => [3, 4, 6],
    'YO' => [3, 4, 5],
    'WA' => [3],
    'N' => [3, 5, 6]
  }.freeze

  # 点字->BITの変換定義
  TENJI_BIT = {
    'o' => 0b1,
    '-' => 0b0,
  }.freeze

end