require "tenji"

class TenjiMaker
  def to_tenji(text)
    tenjis = text.split(" ").map { |str| Tenji.new(str) }

    tenji_matrix = tenjis.map(&:to_h).map do |tenji_hash|
      [
        tenji_hash[1] + tenji_hash[4],
        tenji_hash[2] + tenji_hash[5],
        tenji_hash[3] + tenji_hash[6],
      ]
    end
    tenji_matrix.transpose.map { |arr| arr.join(" ") }.join("\n")
  end
end
