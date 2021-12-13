# frozen_string_literal: true

class MarkBuilder
  DELMITER = ' '

  def builds(tenjis)
    @tenjis = tenjis

    result = ''
    SQUARE_POSITION_ROWS.each do |row|
      result += create_mark_str_per_row(row)
      result.strip!
      result += "\n"
    end

    result.strip!
    result
  end

  private

  def create_mark_str_per_row(row)
    result = ''

    tenjis.each do |tenji|
      row.each do |position|
        result += tenji.squares.include?(position) ? DOT_MARK : NON_DOT_MARK
      end

      result += DELMITER
    end

    result
  end

  attr_reader :tenjis

  DOT_MARK = 'o'
  NON_DOT_MARK = '-'
  SQUARE_POSITION_ROWS = [
    [1, 4], [2, 5], [3, 6]
  ].freeze

  private_constant :DOT_MARK, :NON_DOT_MARK, :SQUARE_POSITION_ROWS
end
