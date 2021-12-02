# frozen_string_literal: true

require_relative 'tenji_formatter'

class TenjiMaker
  def to_tenji(text)
    letters = text.split(' ')
    tenji_formatter = TenjiFormatter.new(letters)
    tenji_formatter.format
  end
end
