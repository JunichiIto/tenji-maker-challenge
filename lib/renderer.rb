class Renderer
  attr_reader :rows

  #
  # 初期化
  #
  # @param [Array] strings
  #
  def initialize(strings)
    @rows = strings.map { |string| Row.new(string) }
  end

  class << self
    #
    # 出力する
    #
    # @param [Array] strings
    #
    # @return [String]
    #
    def render(strings)
      renderer = new(strings)
      template(renderer)
    end

    private

    def template(renderer)
      <<~TEXT.chomp
        #{renderer.first_row}
        #{renderer.second_row}
        #{renderer.third_row}
      TEXT
    end
  end

  #
  # 1行目の出力
  #
  # @return [String]
  #
  def first_row
    @rows.map(&:first).join(' ')
  end

  #
  # 2行目の出力
  #
  # @return [String]
  #
  def second_row
    @rows.map(&:second).join(' ')
  end

  #
  # 3行目の出力
  #
  # @return [String]
  #
  def third_row
    @rows.map(&:third).join(' ')
  end

  #
  # 行
  #
  class Row
    attr_reader :first, :second, :third

    #
    # 初期化
    #
    # @param [String] string
    #
    def initialize(string)
      @first = string.slice(0, 2)
      @second = string.slice(2, 2)
      @third = string.slice(4, 2)
    end
  end
end
