require_relative '../lib/tenji_handler'

class TenjiBoin
  include TenjiHandler

  def to_tenji_boin_array(char)
    template = Array.new(3) { Array.new(2, '-') }
    case char
    when 'A'
      template[0][0] = 'o'
      template
    when 'I'
      template[1][0] = 'o'
      merge_tenji_array(to_tenji_boin_array('A'), template)
    when 'U'
      template[0][1] = 'o'
      merge_tenji_array(to_tenji_boin_array('A'), template)
    when 'E'
      merge_tenji_array(to_tenji_boin_array('I'), to_tenji_boin_array('U'))
    when 'O'
      template[0][1] = 'o'
      template[1][0] = 'o'
      template
    end
  end
end
