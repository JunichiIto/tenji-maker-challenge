#!/usr/bin/ruby
#coding:utf-8

class TenjiMaker

    Vowels = {
        'A'=>0b100000, 'I'=>0b101000, 'U'=>0b110000, 'E'=>0b111000, 'O'=>0b011000
    }
    VowelsDown = {
        'A'=>0b000010, 'I'=>0b001010, 'U'=>0b000011, 'E'=>0b001110, 'O'=>0b000110
    }
    Consonants = {
        ''=>  [0b000000],           'K'=> [0b000001],           'S'=> [0b000101],           'T'=> [0b000110],           'N'=> [0b000010],
        'H'=> [0b000011],           'M'=> [0b000111],           'Y'=> [0b010000],           'R'=> [0b000100],           'W'=> [0b000000],
        'G'=> [0b000100, 0b000001], 'Z'=> [0b000100, 0b000101], 'D'=> [0b000100, 0b000110], 'B'=> [0b000100, 0b000011], 'P'=> [0b000001, 0b000011],
        'KY'=>[0b010000, 0b000001], 'SY'=>[0b010000, 0b000101], 'TY'=>[0b010000, 0b000110], 'NY'=>[0b010000, 0b000010],
        'HY'=>[0b010000, 0b000011], 'MY'=>[0b010000, 0b000111], 'RY'=>[0b010000, 0b000100],
        'GY'=>[0b010100, 0b000001], 'ZY'=>[0b010100, 0b000101], 'DY'=>[0b010100, 0b000110], 'BY'=>[0b010100, 0b000011], 'PY'=>[0b010001, 0b000011],
        'WH'=>[0b001001, 0b000000], 'KW'=>[0b001001, 0b000001], 'TS'=>[0b001001, 0b000110], 'F'=> [0b001001, 0b000011],
        'GW'=>[0b001101, 0b000001], 'V'=> [0b001101, 0b000011],
    }
    N = 0b000111
    T = 0b001000
    Dash = 0b001100

    def codes_to_braille(codes)
        codepoint_map = [32,4,16,2,8,1]
        codes.map{|e|(0..5).reduce(0x2800){|s,i|s+e[i]*codepoint_map[i]}.chr('UTF-8')}*''
    end

    def codes_to_base64(codes)
        # quite similar to codes_to_braille except transcode table.
        base64 = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
        codepoint_map = [32,4,16,2,8,1]
        codes.map{|e|base64[(0..5).reduce(0){|s,i|s+e[i]*codepoint_map[i]}]}*''
    end

    def codes_to_tenji(codes)
        codes.map{|e|('%06b'%e).tr('01','-o').scan(/../)}.transpose.map{|e|e*' '}*"\n"
    end

    def roman_to_codes(roman)
        codes = []
        current_consonant = ''
        roman.each_char{|c|
            if c == ' '
                codes.push(0)
            elsif c == ','
                codes.push(0b000101)
            elsif c == '.'
                codes.push(0b001101)
            elsif c == '?'
                codes.push(0b001001)
            elsif c == '!'
                codes.push(0b001110)
            elsif c == '-'
                raise '子音(%s)の後に長音を挿入しようとしました'%current_consonant if !current_consonant.empty?
                codes.push(Dash)
            elsif Vowels.include?(c)
                if ['Y', 'W'].include?(current_consonant)
                    vowel_code = VowelsDown[c]
                else
                    vowel_code = Vowels[c]
                end
                consonant_code = Consonants[current_consonant]
                codes.concat(consonant_code[0...-1] + [consonant_code[-1] | vowel_code])
                current_consonant = ''
            else
                if current_consonant[-1] == c
                    raise '複数のローマ字からなる子音(%s)の後に促音を挿入しようとしました'%current_consonant if current_consonant.size > 1
                    if current_consonant == 'N'
                        codes.push(N)
                        current_consonant = ''
                    else
                        codes.push(T)
                    end
                else
                    current_consonant += c
                    if !Consonants.include?(current_consonant)
                        raise '予期せぬ子音(%s)が入力されました'%current_consonant if current_consonant[0]!='N'
                        codes.push(N)
                        current_consonant = current_consonant[1..-1]
                    end
                end
            end
        }
        if !current_consonant.empty?
            raise '文字列が子音で終端しています(%s)'%current_consonant if current_consonant != 'N'
            codes.push(N)
        end
        codes
    end

    def to_tenji(roman)
        codes_to_tenji roman_to_codes roman
    end

    def to_braille(roman)
        codes_to_braille roman_to_codes roman
    end

    def to_base64(roman)
        codes_to_base64 roman_to_codes roman
    end

end

if __FILE__ == $0
    puts TenjiMaker.new.to_tenji gets.chomp.upcase
end
