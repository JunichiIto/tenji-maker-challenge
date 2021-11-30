require_relative '../lib/tenji_handler'
require_relative '../lib/tenji_single_char'
require_relative '../lib/tenji_double_char'

class TenjiCharGenerator
  include TenjiHandler

  def initialize
    @tenji_single = TenjiSingleChar.new
    @tenji_double = TenjiDoubleChar.new
  end

  def to_tenji(source_string)
    tenji_single_array = @tenji_single.to_tenji_single_array(source_string[-1])
    return show_tenji(tenji_single_array) if source_string.length == 1

    tenji_double_array = @tenji_double.to_tenji_double_array(source_string[0])
    case source_string
    when "YA", "YU", "WA" then
      show_tenji(merge_tenji_array(tenji_double_array, tenji_single_array.reverse))
    when "YO" then
      show_tenji(merge_tenji_array(tenji_double_array, tenji_single_array.rotate(-1)))
    else
      show_tenji(merge_tenji_array(tenji_double_array, tenji_single_array))
    end
  end
end
