class TenjiMaker
  def to_tenji(text)
    # 以下はサンプルの仮実装なので、このcase文は全部消して自作ロジックに書き直すこと
    case text
    when 'A HI RU'
      <<~TENJI
        o- o- oo
        -- o- -o
        -- oo --
      TENJI
    when 'KI RI N'
      <<~TENJI
        o- o- --
        o- oo -o
        -o -- oo
      TENJI
    when 'SI MA U MA'
      <<~TENJI
        o- o- oo o-
        oo -o -- -o
        -o oo -- oo
      TENJI
    when 'NI WA TO RI'
      <<~TENJI
        o- -- -o o-
        o- -- oo oo
        o- o- o- --
      TENJI
    when 'HI YO KO'
      <<~TENJI
        o- -o -o
        o- -o o-
        oo o- -o
      TENJI
    when 'KI TU NE'
      <<~TENJI
        o- oo oo
        o- -o o-
        -o o- o-
      TENJI
    end
  end
end
