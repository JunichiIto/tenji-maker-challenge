# frozen_string_literal: true

require_relative 'tenji_number'

class TenjiFormatter
  def initialize(letters)
    @letters = letters
  end

  def format
    build_display_table.map { |row| row.join(' ').rstrip }.join("\n")
  end

  private

  def build_display_table
    rows =
      to_tenji_characters.map do |characters|
        first_row = characters[0] + characters[3]
        second_row = characters[1] + characters[4]
        third_row = characters[2] + characters[5]
        [first_row, second_row, third_row]
      end
    rows[0].zip(*rows[1..])
  end

  def to_tenji_characters
    read_tenji_numbers.map do |numbers|
      default_characters = ['-', '-', '-', '-', '-', '-']
      numbers.each { |number| default_characters[number - 1] = 'o' }
      default_characters
    end
  end

  def read_tenji_numbers
    tenji_numbers = TenjiNumber.new(@letters)
    tenji_numbers.convert_to_number
  end
end
