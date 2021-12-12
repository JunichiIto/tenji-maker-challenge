class ExtendDefineCode
  module Tenji
    BASE_WORD = {
      A: 0b100000,
      I: 0b110000,
      U: 0b100100,
      E: 0b110100,
      O: 0b010100,
      N: 0b001011
    }.freeze
  
    DEFINE_CONSONANT = {
      K: 0b000001,
      S: 0b000011,
      T: 0b001010,
      N: 0b001000,
      H: 0b001001,
      M: 0b001011,
      R: 0b000010,
      Y: {
        YA: 0b001100,
        YU: 0b001101,
        YO: 0b001110
      },
      W: {
        WA:  0b001000,
        WO:  0b001010,
      },
    }.freeze
  end
end