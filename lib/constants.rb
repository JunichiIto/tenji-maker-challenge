class TenjiMaker
  VOWELS = { A: [1, 0, 0], I: [1, 0, 1], U: [1, 1, 0], E: [1, 1, 1], O: [0, 1, 1] }.freeze

  CONSONANTS = { K: [0, 0, 1], S: [1, 0, 1], T: [1, 1, 0],
                 N: [0, 1, 0], H: [0, 1, 1], M: [1, 1, 1],
                 R: [1, 0, 0] }.freeze

  IRREGULARS = { YA: [0, 1, 0, 0, 1, 0], YU: [0, 1, 0, 0, 1, 1],
                 YO: [0, 1, 0, 1, 1, 0], WA: [0, 0, 0, 0, 1, 0],
                 N: [0, 0, 0, 1, 1, 1] }.freeze
end
