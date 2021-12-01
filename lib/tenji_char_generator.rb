require_relative '../lib/tenji_handler'
require_relative '../lib/tenji_single_char'
require_relative '../lib/tenji_double_char'

class TenjiCharGenerator
  include TenjiHandler

  def initialize
    @tenji_single = TenjiSingleChar.new
    @tenji_double = TenjiDoubleChar.new
  end

  def to_tenji_char(romaji_char)
    tenji_single_array = @tenji_single.to_tenji_single_array(romaji_char[-1])
    return tenji_single_array if romaji_char.length == 1

    tenji_double_array = @tenji_double.to_tenji_double_array(romaji_char[0])
    case romaji_char
    when "YA", "YU", "WA" then
      merge_tenji_array(tenji_double_array, tenji_single_array.reverse)
    when "YO" then
      merge_tenji_array(tenji_double_array, tenji_single_array.rotate(-1))
    else
      merge_tenji_array(tenji_double_array, tenji_single_array)
    end
  end
end
