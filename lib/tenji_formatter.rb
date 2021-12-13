# frozen_string_literal: true

require_relative 'tenji_character'

# Format braille cells.
class TenjiFormatter
  def initialize(letters)
    @letters = letters
  end

  def format_display_table
    build_table.map { |row| row.join(' ').rstrip }.join("\n")
  end

  private

  def build_table
    build_rows.transpose
  end

  def build_rows
    characters = build_character
    characters.map do |character|
      first_row = character[0] + character[3]
      second_row = character[1] + character[4]
      third_row = character[2] + character[5]
      [first_row, second_row, third_row]
    end
  end

  def build_character
    @letters.map do |letter|
      tenji_character = TenjiCharacter.new(letter)
      tenji_character.build_character
    end
  end
end
