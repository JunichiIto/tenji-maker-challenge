require_relative '../lib/tenji_handler'

class TenjiDoubleChar
  include TenjiHandler

  def to_tenji_double_array(char)
    template = Array.new(3) { Array.new(2, '-') }
    case char
    when 'K' then
      template[2][1] = 'o'
      template
    when 'S' then
      merge_tenji_array(to_tenji_double_array('K'), to_tenji_double_array('R'))
    when 'T' then
      merge_tenji_array(to_tenji_double_array('N'), to_tenji_double_array('R'))
    when 'N' then
      template[2][0] = 'o'
      template
    when 'H' then
      merge_tenji_array(to_tenji_double_array('K'), to_tenji_double_array('N'))
    when 'M' then
      merge_tenji_array(to_tenji_double_array('H'), to_tenji_double_array('R'))
    when 'R' then
      template[1][1] = 'o'
      template
    when 'Y' then
      template[0][1] = 'o'
      template
    when 'W'
      template
    end
  end
end
