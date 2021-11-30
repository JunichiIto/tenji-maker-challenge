require_relative '../lib/tenji_handler'

class TenjiSingleChar
  include TenjiHandler

  def to_tenji_single_array(char)
    template = Array.new(3) { Array.new(2, '-') }
    case char
    when 'A' then
      template[0][0] = 'o'
      template
    when 'I' then
      template[1][0] = 'o'
      merge_tenji_array(to_tenji_single_array('A'), template)
    when 'U' then
      template[0][1] = 'o'
      merge_tenji_array(to_tenji_single_array('A'), template)
    when 'E' then
      merge_tenji_array(to_tenji_single_array('I'), to_tenji_single_array('U'))
    when 'O' then
      template[0][1] = 'o'
      template[1][0] = 'o'
      template
    when 'N' then
      # Eの配列を上下反転、左右反転させる
      # https://mebee.info/2020/12/15/post-23548/
      to_tenji_single_array('E').reverse.map(&:reverse)
    end
  end
end
