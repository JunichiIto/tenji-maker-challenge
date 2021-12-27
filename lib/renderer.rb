class Renderer
  class << self
    #
    # 出力する
    #
    # @param [Array] strings
    #
    # @return [String]
    #
    def render(strings)
      3.times.map do |n|
        strings.map { |string| parts(string, n) }.join(' ')
      end.join("\n")
    end

    private

    def parts(string, number)
      return string.slice(0, 2) if number == 0
      return string.slice(2, 2) if number == 1

      string.slice(4, 2) if number == 2
    end
  end
end
