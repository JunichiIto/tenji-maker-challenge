require 'Matrix'

# 180度回転
def rotate180(matrix)
  Matrix.rows(matrix.to_a.reverse.map(&:reverse))
end

# 上下反転
def reverse(matrix)
  Matrix.rows(matrix.to_a.reverse)
end

# 一番下に下げる
def down(tenji_to_a)
  return Matrix.rows(tenji_to_a) unless tenji_to_a[2].sum.zero?
  down([
    [0, 0],
    tenji_to_a[0],
    tenji_to_a[1]
  ])
end

class TenjiMaker
  class << self
    attr_accessor :boin, :siin
  end
  
  @boin = {
    'A' => Matrix[
      [1, 0],
      [0, 0],
      [0, 0],
    ],
    'I' => Matrix[
      [1, 0],
      [1, 0],
      [0, 0],
    ],
    'U' => Matrix[
      [1, 1],
      [0, 0],
      [0, 0],
    ],
    'E' => Matrix[
      [1, 1],
      [1, 0],
      [0, 0],
    ],
    'O' => Matrix[
      [0, 1],
      [1, 0],
      [0, 0],
    ]
  }
  @boin['N'] = rotate180(@boin['E'])
  @siin = {
    'K' => rotate180(@boin['A']),
    'S' => rotate180(@boin['I']),
    'T' => rotate180(@boin['O']),
    'N' => reverse(@boin['A']),
    'H' => rotate180(@boin['U']),
    'M' => rotate180(@boin['E']),
    # 'Y'
    'R' => Matrix[
      [0, 0],
      [0, 1],
      [0, 0],
    ]
    # 'W'
  }

  def exceptional(bo, si)
    if si == 'Y'
      down(self.class.boin[bo].to_a) + Matrix[[0,1], [0,0], [0,0]]
    elsif si == 'W'
      down(self.class.boin[bo].to_a)
    else
      nil
    end
  end

  def to_tenji(text)
    ary = []
    text.split.each do |romaji|
      bo = romaji.split('')[-1]
      si = romaji.split('')[-2]
      # 例外的な場合 (今回は、やゆよわを)
      ex = exceptional(bo, si)
      if ex
        ary << ex
        next
      end
      # 通常 (母音 + 子音 or 子音のみ)
      if si
        ary << self.class.boin[bo] + self.class.siin[si]
      else
        ary << self.class.boin[bo]
      end
    end

    # 表示
    output = ''
    text_num = text.split.length
    3.times do |y|
      text_num.times do |x|
        output << (ary[x].element(y, 0).zero? ? '-' : 'o')
        output << (ary[x].element(y, 1).zero? ? '-' : 'o')
        output << ' '
      end
      output = output.chop + "\n"
    end
    output.chomp
  end
end
