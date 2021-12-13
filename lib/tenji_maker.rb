# frozen_string_literal: true

require_relative 'tenji'
require_relative 'mark_builder'

class TenjiMaker
  def to_tenji(text)
    strings = text.split(' ')
    tenjis = strings.map { |string| Tenji.new(string) }

    builder = MarkBuilder.new
    builder.builds(tenjis)
  end
end
