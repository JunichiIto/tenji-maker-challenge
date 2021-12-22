class TenjiMaker

  # http://www.naiiv.net/braille/?tenji-sikumi
  TABLE = {
    A: [1],
    I: [1, 2],
    U: [1, 4],
    E: [1, 2, 4],
    O: [2, 4],
    K_: [6],
    S_: [5, 6],
    T_: [3, 5],
    N_: [3],
    H_: [3, 6],
    M_: [3, 5, 6],
    R_: [5],
    YA: [3, 4],
    YU: [3, 4, 6],
    YO: [3, 4, 5],
    WA: [3],
    WO: [3, 5],
    N: [3, 5, 6],
  }

  def to_tenji text
    lines = [[], [], []]
    text.split(' ').each do |t|
      @indexes = TABLE[t.to_sym] || TABLE[(t[0] + '_').to_sym] + TABLE[t[1].to_sym]
      draw.each_with_index{|line, i| lines[i] << line }
    end
    lines.map{|line| line.join(' ') }.join("\n")
  end

  private

  def draw
    [
      mark(1) + mark(4),
      mark(2) + mark(5),
      mark(3) + mark(6),
    ]
  end

  def mark index
    @indexes.include?(index) ? 'o' : '-'
  end
end
