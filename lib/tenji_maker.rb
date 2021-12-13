class TenjiMaker
  TENJI_TABLE = {
     A: '1',     I: '12',     U: '14',     E: '124',     O: '24',
    KA: '16',   KI: '126',   KU: '146',   KE: '1246',   KO: '246',
    SA: '156',  SI: '1256',  SU: '1456',  SE: '12456',  SO: '2456',
    TA: '135',  TI: '1235',  TU: '1435',  TE: '12435',  TO: '2435',
    NA: '13',   NI: '123',   NU: '143',   NE: '1243',   NO: '243',
    HA: '136',  HI: '1236',  HU: '1436',  HE: '12436',  HO: '2436',
    MA: '1356', MI: '12356', MU: '14356', ME: '124356', MO: '24356',
    YA: '34',                YU: '364',                 YO: '354',
    RA: '15',   RI: '125',   RU: '145',   RE: '1245',   RO: '245',
    WA: '3', N: '356'
  }.transform_keys(&:to_s).freeze

  def to_tenji(text)
    cells = text.split.map do |sound|
      dots = %w[1 2 3 4 5 6].map do |dot_number|
        TENJI_TABLE[sound].include?(dot_number) ? 'o' : '-'
      end

      [
        dots[0] + dots[3],
        dots[1] + dots[4],
        dots[2] + dots[5]
      ]
    end

    cells.transpose.map{ |row| row.join(' ') }.join("\n")
  end
end
