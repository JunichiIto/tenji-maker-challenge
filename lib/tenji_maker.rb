require_relative 'tenji_maker/code'
require_relative 'tenji_maker/util'

class TenjiMaker
  include TenjiMaker::Code
  include TenjiMaker::Util

  def to_tenji(text)
    tenjis = []
    text.split(' ').each do |rome_str|
      tenjis << R2T_TABLE[rome_str.to_sym]
    end
    stringify_tenjis(tenjis)
  end
end
